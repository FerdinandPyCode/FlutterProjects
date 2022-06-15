import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/custom_widget/padding_with.dart';
import 'package:socialnetwork/custom_widget/profile_image.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/model/post.dart';
import 'package:socialnetwork/util/date_handler.dart';

class PostContent extends StatelessWidget {
  Post post;
  Member member;

  PostContent({required this.post, required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Row(
                children: [
                  ProfileImage(urlString: member.imageUrl, onPressed: () {},urlValid: member.imageUrl!=null,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${member.surname} ${member.name}"),
                      Text(DateHandler().myDate(post.date!))
                    ],
                  )
                ],
              ),
              const Divider(),
              (post.imageUrl != null && post.imageUrl != "")
                  ? PaddingWith(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(post.imageUrl!),
                            fit: BoxFit.cover
                        )
                    ),
                  )
              )
                  : Container(height: 0, width: 0,),
              (post.text != null && post.text != "")
                  ? Text(post.text!)
                  :  Container(height: 0, width: 0,),
            ],
          );
  }
}