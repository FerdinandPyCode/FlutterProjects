import 'dart:async';
import 'package:flutter/material.dart';
import 'package:socialnetwork/controller/loading_controller.dart';
import 'package:socialnetwork/custom_widget/bar_item.dart';
import 'package:socialnetwork/model/color_theme.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/page/home_page.dart';
import 'package:socialnetwork/page/members_page.dart';
import 'package:socialnetwork/page/notif_page.dart';
import 'package:socialnetwork/page/profile_page.dart';
import 'package:socialnetwork/page/write_post.dart';
import 'package:socialnetwork/util/constants.dart';
import 'package:socialnetwork/util/firebase_handler.dart';

class MainController extends StatefulWidget {
  MainController({Key? key, required this.memberUid}) : super(key: key);
  String? memberUid = "";

  @override
  State<MainController> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  StreamSubscription? streamSubscription = null;
  Member? member = null;
  int index = 0;

  @override
  void initState() {
    super.initState();
    //Recupère user à partir de uid
    streamSubscription = FirebaseHandler()
        .fire_user
        .doc(widget.memberUid)
        .snapshots()
        .listen((event) {
      setState(() {
        member = Member(event);
      });
    });
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (member == null)
        ? const LoadingController()
        : Scaffold(
            key: _globalKey,
            body: Center(
              child: showPage(),
            ),
            bottomNavigationBar: BottomAppBar(
              color: ColorTheme.accent(),
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BarItem(
                      icon: homeIcon,
                      onPressed: (() => buttonSelected(0)),
                      selected: (index == 0)),
                  BarItem(
                      icon: friendsIcon,
                      onPressed: (() => buttonSelected(1)),
                      selected: (index == 1)),
                  Container(
                    height: 0,
                    width: 0,
                  ),
                  BarItem(
                      icon: notifIcon,
                      onPressed: (() => buttonSelected(2)),
                      selected: (index == 2)),
                  BarItem(
                      icon: profileIcon,
                      onPressed: (() => buttonSelected(3)),
                      selected: (index == 3))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _globalKey.currentState?.showBottomSheet(
                    (context) => WritePost(memberId: member?.uid));
              },
              child: writePost,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
  }

  buttonSelected(int i) {
    setState(() {
      index = i;
    });
  }

  Widget showPage() {
    return (index == 0)
        ? HomePage(member: member!)
        : (index == 1)
            ? MembersPage(member: member!)
            : (index == 2)
                ? NotifPage(member: member!)
                : (index == 3)
                    ? ProfilePage(member: member!)
                    : const Center(
                        child: Text("Error"),
                      );
  }
}
