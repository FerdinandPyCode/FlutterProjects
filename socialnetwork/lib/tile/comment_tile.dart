import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/custom_widget/profile_image.dart';
import 'package:socialnetwork/model/color_theme.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/model/member_comment.dart';
import 'package:socialnetwork/util/firebase_handler.dart';

class CommentTile extends StatelessWidget {
  MemberComment? memberComment;

  CommentTile({required this.memberComment});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseHandler().fire_user.doc(memberComment!.memberId).snapshots(),
        builder: (context, snap) {
      if (snap.hasData) {
        Member member = Member(snap.data!);
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                    ProfileImage(urlString: member.imageUrl, onPressed: () {}),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              <²²                                                                     ²                                          ²                                                                                                                                                                                                                                                                                                            X²²²²²²²²  
                    Text("${member.surname} ${member.name}")
                  ],
                ),
                Text(memberComment.date, style: TextStyle(color: ColorTheme.pointer(), fontStyle: FontStyle.italic),)
              ],
            ),
            Center(child: Text(memberComment.text),)
          ],
        );
      } else {
        return Container(height: 0, width: 0);
      };
    });
  }


}