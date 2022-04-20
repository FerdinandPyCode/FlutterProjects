import 'package:church_app/texteavecstyle.dart';
import 'package:flutter/material.dart';

class Bilan extends StatefulWidget {

  ValueNotifier<int> npage= ValueNotifier(0);
  Bilan({ Key? key,required this.npage }) : super(key: key);

  @override
  State<Bilan> createState() => _BilanState();
}

class _BilanState extends State<Bilan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:const EdgeInsets.all(30.0),
          height: 100.0,
          width: double.infinity,
          color: Colors.blue[300],
          child: TexteAvecStyle(
            "Bilan",
            fontSize: 30.0,
            color: Colors.white,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child:Column(
                children: [
                  Container(
                    height: 200,
                    color:Colors.green
                  ),
                  Container(
                    height: 200,
                    color:Colors.black
                  ),
                  Container(
                    height: 200,
                    color:Colors.orange
                  ),
                  Container(
                    height: 200,
                    color:Colors.teal
                  ),
                  Container(
                    height: 200,
                    color:Colors.brown
                  ),
                  Container(
                    height: 200,
                    color:Colors.grey
                  ),
                ],
              ) ,
            )
          )
      ],
    );
  }
}