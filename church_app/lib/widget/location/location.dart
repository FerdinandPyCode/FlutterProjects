import 'package:church_app/texteavecstyle.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  ValueNotifier<int> npage= ValueNotifier(0);
  Location({ Key? key,required npage}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
            "Locations",
            fontSize: 30.0,
            color: Colors.white,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child:Column(
                children: [
                  const SizedBox(height: 50.0,),
                    Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      
                      onPressed: (){
                        setState(() {
                          widget.npage.value=5;
                        });
                      },
                      child: TexteAvecStyle(
                        "Ajouter un actif",
                        fontSize: 25.0,
                        color: Colors.white,
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                          alignment: Alignment.center,
                          fixedSize: MaterialStateProperty.all(const Size(400, 75)),
                          overlayColor: MaterialStateProperty.all(Colors.red),
                           shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          animationDuration: const Duration(milliseconds: 100),
                        ),
                        ),
                      ),
                       const SizedBox(height: 30.0,),
                    Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      
                      onPressed: (){
                        setState(() {
                          widget.npage.value=6;
                        });
                      },
                      child: TexteAvecStyle(
                        "Liste des actifs",
                        fontSize: 25.0,
                        color: Colors.white,
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                          alignment: Alignment.center,
                          fixedSize: MaterialStateProperty.all(const Size(400, 75)),
                          overlayColor: MaterialStateProperty.all(Colors.red),
                           shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          animationDuration: const Duration(milliseconds: 100),
                        ),
                        ),
                      ),
                       const SizedBox(height: 30.0,),
                    
                    Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      
                      onPressed: (){
                        setState(() {
                          widget.npage.value=8;
                        });
                      },
                      child: TexteAvecStyle(
                        "Quêtes",
                        fontSize: 25.0,
                        color: Colors.white,
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                          alignment: Alignment.center,
                          fixedSize: MaterialStateProperty.all(const Size(400, 75)),
                          overlayColor: MaterialStateProperty.all(Colors.red),
                           shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          animationDuration: const Duration(milliseconds: 100),
                        ),
                        ),
                      ),
                       const SizedBox(height: 30.0,),
                    Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      
                      onPressed: (){
                        setState(() {
                          widget.npage.value=9;
                        });
                      },
                      child: TexteAvecStyle(
                        "Dépenses",
                        fontSize: 25.0,
                        color: Colors.white,
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                          alignment: Alignment.center,
                          fixedSize: MaterialStateProperty.all(const Size(400, 75)),
                          overlayColor: MaterialStateProperty.all(Colors.red),
                           shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          animationDuration: const Duration(milliseconds: 100),
                        ),
                        ),
                      ),
                       const SizedBox(height: 30.0,),
                    Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      
                      onPressed: (){
                        setState(() {
                          widget.npage.value=10;
                        });
                      },
                      child: TexteAvecStyle(
                        "Toilettes",
                        fontSize: 25.0,
                        color: Colors.white,
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                          alignment: Alignment.center,
                          fixedSize: MaterialStateProperty.all(const Size(400, 75)),
                          overlayColor: MaterialStateProperty.all(Colors.red),
                           shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          animationDuration: const Duration(milliseconds: 100),
                        ),
                        ),
                      ),
                ],
              ) ,
            )
          )
      ],
    );
  }
}