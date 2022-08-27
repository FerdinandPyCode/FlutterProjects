import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/model/member_comment.dart';
import 'package:socialnetwork/model/post.dart';
import 'package:socialnetwork/tile/comment_tile.dart';
import 'package:socialnetwork/tile/post_tile.dart';
import 'package:socialnetwork/util/constants.dart';

class DetailPage extends StatefulWidget {

  Post post;
  Member member;

  DetailPage({required this.post, required this.member});

  @override
  State<StatefulWidget> createState() => DetailState();
}

class DetailState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Détail du post")),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(

        stream:  widget.post.ref!.snapshots() as Stream<DocumentSnapshot<Map<String, dynamic>>>,

        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snaps) {
          List<MemberComment> comments = [];
          final  Map<String, dynamic>? datas = snaps.data!.data();
          final   commentsSnap = datas?[commentKey];
          commentsSnap.forEach((s) {
            comments.add(MemberComment(s));
          });
          print(comments.length);
          return ListView.separated(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return PostTile(post: widget.post, member: widget.member,/* isDetail: true,*/);
                } else {
                  MemberComment comment = comments[index - 1];
                  return CommentTile(memberComment: comment);
                }
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: comments.length + 1
          );
        },
      )
    );
  }
}