// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'model.dart';

class PageDetail extends StatelessWidget {

  late Human item;

  PageDetail(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: (
          AppBar(
            title:const Text("PLus d'nformation"),
            centerTitle: true,
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Center(
              child:Column(
               children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  child: const CircleAvatar(
                    backgroundImage:AssetImage("assets/2.png"),
                    radius: 75,
                  ),
                ),
              
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text(
                   "${item.lastname} ${item.firstname}",
                   textAlign: TextAlign.center,
                   style:const TextStyle(
                     color: Colors.black,
                     fontSize: 15.0
                   ),
                 ),
               ),
               
             ],
            ),
          ),
            const Divider(height: 10,thickness: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 75.0,right: 5.0),
                  child:Text(
                    "Sexe :",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.only(top: 20.0,bottom: 20.0),
                  child: Text(
                    item.gender,
                    //textAlign: TextAlign.center,
                    style:const TextStyle(
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 75.0,right: 5.0),
                  child:Text(
                    "Adress :",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),

                Padding(
                  padding:const EdgeInsets.only(top: 20.0,bottom: 20.0),
                  child: Text(
                    item.adress,
                    //textAlign: TextAlign.center,
                    style:const TextStyle(
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 75.0,right: 5.0),
                  child:Text(
                    "Phone number:",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                
                Padding(
                  padding:const EdgeInsets.only(top: 20.0,bottom: 20.0),
                  child: Wrap(
                    children: [
                      Text(
                        item.phone,
                        //textAlign: TextAlign.center,
                        style:const TextStyle(
                            fontSize: 15.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontStyle: FontStyle.italic
                        ),
                    ),
                    ]
                  ),
                ),
              ],
            ),

           const Divider(height: 10, thickness: 2,),

           Padding(
                padding:const EdgeInsets.only(left:15,top: 20.0,bottom: 20.0,right:15),
                child: Text(
                  item.citation,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      fontSize: 20.0,
                      //fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}