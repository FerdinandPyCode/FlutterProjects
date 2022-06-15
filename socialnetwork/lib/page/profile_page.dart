import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialnetwork/custom_widget/profile_image.dart';
import 'package:socialnetwork/delegate/header_delegate.dart';
import 'package:socialnetwork/model/alerte_helper.dart';
import 'package:socialnetwork/model/color_theme.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/model/post.dart';
import 'package:socialnetwork/tile/post_tile.dart';
import 'package:socialnetwork/util/constants.dart';
import 'package:socialnetwork/util/firebase_handler.dart';
import 'package:socialnetwork/util/images.dart';

class ProfilePage extends StatefulWidget {
  late Member member;
  ProfilePage({Key? key, required this.member}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ScrollController _controller = ScrollController();
  TextEditingController _name=TextEditingController();
  TextEditingController _surname=TextEditingController();
  TextEditingController _desc=TextEditingController();

   bool get scrolled {
    return _controller.hasClients && _controller.offset > 200 - kToolbarHeight;
  }

  @override
  void initState() {
    final authId = FirebaseHandler().authInstance.currentUser!.uid;
    isMe=(authId==widget.member.uid);
    _controller = ScrollController()
      ..addListener(() {
        setState(() {});
      });

    _name = TextEditingController();
    _surname = TextEditingController();
    _desc = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _desc.dispose();
    _surname.dispose();
    _name.dispose();
    super.dispose();
  }

  bool isMe=false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseHandler().postFrom(widget.member.uid),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (snapshots.hasData) {
            return CustomScrollView(
              controller: _controller,
              slivers: [
                appBar(),
                persistent(),
                list(snapshots.data?.docs),
              ],
            );
          } else {
            return const Center(
              child: Text("Aucun post pour l'instant"),
            );
          }
        });
  }

  SliverAppBar appBar() {
    return SliverAppBar(
      backgroundColor: ColorTheme.pointer(),
      pinned: true,
      expandedHeight: 200,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings,size: 30,),
          onPressed: () {
            AlerteHelper().disconnect(context);
          },
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    profileImage
                    ),
                    fit: BoxFit.cover
                )
              ),
        ),
        title: (scrolled)
            ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileImage(urlString: widget.member.imageUrl, onPressed: () {}, imageSize: 20,urlValid: widget.member.imageUrl!=null),
            //Container(height: 10,width: 10,color: Colors.red,),
            const SizedBox(width: 7.5,),
            Text("${widget.member.surname} ${widget.member.name}"),
          ],
        ): //Container(height: 10,width: 10,color: Colors.red,),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 80,/*left: MediaQuery.of(context).size.width8*/right:MediaQuery.of(context).size.width/6 ),
            child: Center(child: ProfileImage(urlString: widget.member.imageUrl, onPressed: (() => takePicture()), imageSize: 40,urlValid: widget.member.imageUrl!=null,)),
          ),
        ),
      ),
    );
  }

  SliverPersistentHeader persistent() {
    return SliverPersistentHeader(
      //pinned: true,
        delegate: HeaderDelegate(
            member: widget.member,
            callback: updateUser,
            scrolled: scrolled
          ),
      );
  }

   updateUser() {
    if (isMe) {
      AlerteHelper().changeUser(
          context,
          member: widget.member,
          name: _name,
          surname: _surname,
          desc: _desc);
    }
  }

  SliverList list(List<QueryDocumentSnapshot>? snapshots) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, index) {
      var n = (snapshots == null) ? 0 : snapshots.length;
      if (index > n) {
        return null;
      } else if (index == n) {
        return const Text("Fin de liste");
      } else {
        return PostTile(post: Post(snapshots![index]), member: widget.member);
      }
    }));
  }

  takePicture() {
    if (isMe) {
      showModalBottomSheet(context: context, builder: (BuildContext ctx) {
        return Container(
          color: Colors.transparent,
          child: Card(
            elevation: 7,
            margin: const EdgeInsets.all(15),
            child: Container(
              color: ColorTheme.base(),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Modification de la photo de profil"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(icon: cameraIcon, onPressed: (() => picker(ImageSource.camera))),
                      IconButton(icon: libraryIcon, onPressed: (() => picker(ImageSource.gallery)))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
    }
  }

  picker(ImageSource source) async {
    final f = await ImagePicker().pickImage(source: source, maxWidth: 500, maxHeight: 500);
    final File file = File(f!.path);
    FirebaseHandler().modifyPicture(file);
  }
}
