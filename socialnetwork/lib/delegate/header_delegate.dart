import 'package:flutter/material.dart';
import 'package:socialnetwork/model/color_theme.dart';
import 'package:socialnetwork/model/member.dart';


class HeaderDelegate extends SliverPersistentHeaderDelegate {

  Member member;
  VoidCallback callback;
  bool scrolled;

  HeaderDelegate({
    required this.callback,
    required this.member,
    required this.scrolled
});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      color:  ColorTheme.accent(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (scrolled) const SizedBox(height: 0, width: 0,) else InkWell(
            child: Text("${member.surname} ${member.name}"),
            onTap: callback
          ),
          Text(member.description ?? "Aucune description"),
          const Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: null, child: Text("Followers: ${member.followers.length}")),
              TextButton(onPressed: null, child: Text("Following: ${member.following.length}")),
            ],
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => (scrolled ? 125: 200);

  @override
  double get minExtent => (scrolled) ? 125 : 200;

  @override
  bool shouldRebuild(HeaderDelegate oldDelegate) => scrolled!= oldDelegate.scrolled || member != oldDelegate.member;
}
