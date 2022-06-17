import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/util/images.dart';

class ProfileImage extends InkWell {
  
  ProfileImage(
      {Key? key,
      required String urlString,
      required VoidCallback onPressed,
      double imageSize = 20,
      required bool urlValid})
      : super(
            //key: key,
            onTap: onPressed,
            child:(urlValid) ? CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: imageSize,
                    backgroundImage: CachedNetworkImageProvider(
                        urlString),
                  ):CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: imageSize,
                    backgroundImage: AssetImage(logoImage),
                  ),
        );
                
}
