

import 'package:flutter/material.dart';
import 'package:todolistappwithloginandstatistic/custom_widget/mydrawer.dart';

class MainController extends StatefulWidget {
  const MainController({ Key? key }) : super(key: key);

  @override
  State<MainController> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title:const Text('TodoApp'),
            centerTitle: true,
            ),
            drawer:const MyDrawer(),
            floatingActionButton: FloatingActionButton(
              onPressed: (() => (){}),
              child:const Icon(Icons.add),
              ),
    );
  }
}