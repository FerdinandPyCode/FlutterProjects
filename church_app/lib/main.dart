import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'ressource.dart';
import 'texteavecstyle.dart';
import 'package:church_app/widget/homescreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(950, 800));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(100.0),// here the desired height
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: double.infinity,
            width: double.infinity,
            color: Colors.red[300],
            child:TexteAvecStyle(
              Res.church_name,
              textAlign: TextAlign.center,
              fontSize: 35.0,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: const HomeScreen(),
    );
  }
}
