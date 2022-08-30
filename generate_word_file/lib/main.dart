import 'dart:io';

import 'package:docx_template/docx_template.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child:ElevatedButton(
            child: Text("Generate"),
            onPressed: generate,
          ),
      ),
    );
    
  }

  generate() async{
    final f = File("lib/template1.docx");
    final docx = await DocxTemplate.fromBytes(await f.readAsBytes());

     /* 
    Or in the case of Flutter, you can use rootBundle.load, then get bytes
    
    final data = await rootBundle.load('lib/assets/users.docx');
    final bytes = data.buffer.asUint8List();

    final docx = await DocxTemplate.fromBytes(bytes);
  */

  // Load test image for inserting in docx
  //final testFileContent = await File('test.jpg').readAsBytes();

  /*final listNormal = ['Foo', 'Bar', 'Baz'];
  final listBold = ['ooF', 'raB', 'zaB'];

  final contentList = <Content>[];

  final b = listBold.iterator;
  for (var n in listNormal) {
    b.moveNext();

    final c = PlainContent("value")
      ..add(TextContent("normal", n))
      ..add(TextContent("bold", b.current));
    contentList.add(c);
  }*/

  Content c = Content();
  c
    ..add(TextContent("namerespos", "Ferdinand le boss des boss"))
    ..add(TextContent("name_user", "ALLOWAKOU Ferdinand"));
    // ..add(TableContent("table", [
    //   RowContent()
    //     ..add(TextContent("key1", "Paul"))
    //     ..add(TextContent("key2", "Viberg"))
    //     ..add(TextContent("key3", "Engineer")),
    //     //..add(ImageContent('img', testFileContent)),
    //   RowContent()
    //     ..add(TextContent("key1", "Alex"))
    //     ..add(TextContent("key2", "Houser"))
    //     ..add(TextContent("key3", "CEO & Founder"))
    //     ..add(ListContent("tablelist", [
    //       TextContent("value", "Mercedes-Benz C-Class S205"),
    //       TextContent("value", "Lexus LX 570")
    //     ]))
    //     //..add(ImageContent('img', testFileContent))
    // ]))
    // ..add(ListContent("list", [
    //   TextContent("value", "Engine")
    //     ..add(ListContent("listnested", contentList)),
    //   TextContent("value", "Gearbox"),
    //   TextContent("value", "Chassis")
    // ]))
    // ..add(ListContent("plainlist", [
    //   PlainContent("plainview")
    //     ..add(TableContent("table", [
    //       RowContent()
    //         ..add(TextContent("key1", "Paul"))
    //         ..add(TextContent("key2", "Viberg"))
    //         ..add(TextContent("key3", "Engineer")),
    //       RowContent()
    //         ..add(TextContent("key1", "Alex"))
    //         ..add(TextContent("key2", "Houser"))
    //         ..add(TextContent("key3", "CEO & Founder"))
    //         ..add(ListContent("tablelist", [
    //           TextContent("value", "Mercedes-Benz C-Class S205"),
    //           TextContent("value", "Lexus LX 570")
    //         ]))
    //     ])),
    //   PlainContent("plainview")
    //     ..add(TableContent("table", [
    //       RowContent()
    //         ..add(TextContent("key1", "Nathan"))
    //         ..add(TextContent("key2", "Anceaux"))
    //         ..add(TextContent("key3", "Music artist"))
    //         ..add(ListContent(
    //             "tablelist", [TextContent("value", "Peugeot 508")])),
    //       RowContent()
    //         ..add(TextContent("key1", "Louis"))
    //         ..add(TextContent("key2", "Houplain"))
    //         ..add(TextContent("key3", "Music artist"))
    //         ..add(ListContent("tablelist", [
    //           TextContent("value", "Range Rover Velar"),
    //           TextContent("value", "Lada Vesta SW Sport")
    //         ]))
    //     ])),
    // ]))
    // ..add(ListContent("multilineList", [
    //   PlainContent("multilinePlain")
    //     ..add(TextContent('multilineText', 'line 1')),
    //   PlainContent("multilinePlain")
    //     ..add(TextContent('multilineText', 'line 2')),
    //   PlainContent("multilinePlain")
    //     ..add(TextContent('multilineText', 'line 3'))
    // ]))
    // ..add(TextContent('multilineText2', 'line 1\nline 2\n line 3'));
    //..add(ImageContent('img', testFileContent));

  final d = await docx.generate(c);
  
  final of = File('generated.docx');
  if (d != null) await of.writeAsBytes(d);

  }
  
}
