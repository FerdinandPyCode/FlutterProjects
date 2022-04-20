import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/model/color_theme.dart';

import '../model/member.dart';

class HeaderDelegate extends SliverChildBuilderDelegate {
  late Member member;
  late VoidCallback callback;
  late bool scrolled;

  HeaderDelegate(
      {required this.callback, required this.member, required this.scrolled});

  @override
  Widget build(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      color: ColorTheme.accent(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          (scrolled)
              ? Container(
                  height: 0,
                  width: 0,
                )
              : InkWell(
                  child: Text("${member.surname} ${member.name}"),
                )
        ],
      ),
    );
  }

  @override
  double get minExtent => (scrolled) ? 150 : 200;

  @override
  double get maxExtent => (scrolled) ? 150 : 200;

  @override
  bool shouldRebuild(HeaderDelegate oldDelegate) {
    return (scrolled != oldDelegate) || member != oldDelegate.member;
  }
}
