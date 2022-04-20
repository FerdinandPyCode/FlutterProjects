import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/custom_widget/padding_with.dart';
import 'package:socialnetwork/custom_widget/profile_image.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/model/post.dart';
import 'package:socialnetwork/util/constants.dart';
import 'package:socialnetwork/util/date_handler.dart';
import 'package:socialnetwork/util/firebase_handler.dart';

class PostTile extends StatelessWidget {
  PostTile({Key? key, required this.snapshot, required this.member})
      : super(key: key);
  late QueryDocumentSnapshot snapshot;
  late Member member;

  @override
  Widget build(BuildContext context) {
    Post post = Post(snapshot);
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PaddingWith(
            child: Column(
              children: [
                Row(
                  children: [
                    ProfileImage(
                        urlString: member.imageUrl,
                        onPressed: () {},
                        imageSize: 35,
                        urlValid:
                            (member.imageUrl != null && member.imageUrl != "")),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${member.surname} ${member.name}"),
                        Text(DateHandler().myDate(post.date!))
                      ],
                    ),
                  ],
                ),
                const Divider(),
                (post.imageUrl != null && post.imageUrl != "")
                    ? PaddingWith(
                        child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  post.imageUrl!,
                                ),
                                fit: BoxFit.cover)),
                      ))
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
                (post.text != null && post.text != "")
                    ? Text(post.text!)
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        FirebaseHandler().addOrRemoveLike(post, member.uid);
                      },
                      icon: (post.likes!.contains(member.uid))
                          ? likeIcon
                          : unlikeIcon,
                    ),
                    Text("${post.likes?.length} likes"),
                    IconButton(onPressed: () {}, icon: commentIcon),
                    Text("${post.comments?.length} comments"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
