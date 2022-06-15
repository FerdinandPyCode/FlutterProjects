import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/custom_widget/padding_with.dart';
import 'package:socialnetwork/custom_widget/post_content.dart';
import 'package:socialnetwork/model/alerte_helper.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/model/post.dart';
import 'package:socialnetwork/page/detail_page.dart';
import 'package:socialnetwork/util/constants.dart';
import 'package:socialnetwork/util/firebase_handler.dart';

class PostTile extends StatelessWidget {
  PostTile({Key? key, required this.post, required this.member})
      : super(key: key);
  late Post post;
  late Member member;

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PaddingWith(
              child: Column(
                children: [
                  
                  PostContent(post: post, member: member),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          FirebaseHandler().addOrRemoveLike(post,FirebaseHandler().authInstance.currentUser!.uid);
                        },
                        icon: (post.likes!.contains(member.uid))
                            ? likeIcon
                            : unlikeIcon,
                      ),
                      Text("${post.likes?.length} likes"),
                      IconButton(
                        onPressed: () {
                          AlerteHelper().writeAComment(context, post: post, commentController: TextEditingController(), member: member);
                        },
                      icon: commentIcon),
                      Text("${post.comments?.length} comments"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: (){
        print('--------------> poste tapped');
        Navigator.pop(context,MaterialPageRoute(
          builder: ((BuildContext ctx){
            return DetailPage(post: post, member: member);
          }))
        );
      },
    );
  }
}
