import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/delegate/header_delegate.dart';
import 'package:socialnetwork/model/alerte_helper.dart';
import 'package:socialnetwork/model/color_theme.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/tile/post_tile.dart';
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

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          icon: const Icon(Icons.logout_outlined),
          onPressed: () {
            AlerteHelper().disconnect(context);
          },
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(profileImage), fit: BoxFit.cover)),
        ),
        title: Text("${widget.member.surname} ${widget.member.name}"),
      ),
    );
  }

  SliverPersistentHeader persistent() {
    return SliverPersistentHeader(
        delegate: HeaderDelegate(
            member: widget.member, callback: () {}, scrolled: false));
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
        return PostTile(snapshot: snapshots![index], member: widget.member);
      }
    }));
  }
}
