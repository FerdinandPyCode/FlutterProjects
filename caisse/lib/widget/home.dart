import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TensorUnit Wallet"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            //padding: null,
            child:ClipPath(
              clipper: OvalBottomBorderClipper(),
                child: Container(
                height: 120,
                color: Colors.blue[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          "Solde :",
                          style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: const Text(
                            "2000",
                            style: TextStyle(
                              color:Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ) ,
          ),
        ],
      ),

      
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child:const Icon(Icons.add,color: Colors.blue,),
            label: "Recette"
          ),
          SpeedDialChild(
            child:const Icon(Icons.remove,color: Colors.blue,),//Text("-",style: TextStyle(fontSize: 35.0,color: Colors.blue),),
            
            label: "Dépense"
          ),
        ],
      ),
    );
  }
}

