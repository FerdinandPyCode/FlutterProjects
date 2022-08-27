import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/custom_widget/profile_image.dart';
import 'package:socialnetwork/model/color_theme.dart';
import 'package:socialnetwork/model/inside_otif.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/model/post.dart';
import 'package:socialnetwork/page/detail_page.dart';
import 'package:socialnetwork/page/profile_page.dart';
import 'package:socialnetwork/util/constants.dart';
import 'package:socialnetwork/util/firebase_handler.dart';

class NotifTile extends StatelessWidget {

  InsideNotif notif;

  NotifTile({Key? key, required this.notif}) : super(key: key);

  @override
  Widget build(BuildContext context){
    print(notif.userId);
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseHandler().fire_user.doc(notif.userId).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snap) {
      if (snap.hasData) {
        print(snap.data!.data());
        Member member = Member(snap.data!);
       return  InkWell(
          onTap: () {
            FirebaseHandler().seenNotif(notif);
            if (notif.type == follow) {
              Navigator.push(context, MaterialPageRoute(builder: (build) {
                return Scaffold(body: ProfilePage(member: member));
              }));
            } else {
              notif.aboutRef.get().then((value) {
                Post post = Post(value);
                Navigator.push(context, MaterialPageRoute(builder: (build) {
                  return DetailPage(post: post, member: member);
                }));
              });
            }
          },
          child: Container(
            color: (notif.seen) ? ColorTheme.base(): ColorTheme.accent(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProfileImage(urlString: member.imageUrl, onPressed: () {},urlValid: false,),
                        ),
                        Text("${member.surname} ${member.name}")
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(notif.date),
                    )
                  ],
                ),
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(notif.text),
                ),)
              ],
            ),
          )
        );
      } else {
        return const Center(child:  Text("Aucune données"));
      }
    });
  }
}