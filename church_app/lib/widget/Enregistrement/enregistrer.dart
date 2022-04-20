import 'package:flutter/material.dart';

import '../../texteavecstyle.dart';

class Enregistrer extends StatefulWidget {

  ValueNotifier<int> npage = ValueNotifier(0);
  Enregistrer({ Key? key,required this.npage}) : super(key: key);
  
  @override
  State<Enregistrer> createState() => _EnregistrerState();
}

class _EnregistrerState extends State<Enregistrer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding:const EdgeInsets.all(30.0),
          height: 100.0,
          width: double.infinity,
          color: Colors.blue[300],
          child: TexteAvecStyle(
            "Enregistrement",
            fontSize: 30.0,
            color: Colors.white,
            ),
          ),
          Expanded(
            child:SingleChildScrollView(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    btnOption("Célébration", 5),
                    btnOption("Ventes", 6),
                    btnOption("Quêtes", 7),
                    btnOption("Dépenses", 8),
                    btnOption("Toilettes", 9),
                    ],
                  ) ,
                ),
            )
        ],
    );
  }

  Widget btnOption(String string,int n){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50.0,),
        Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: (){
            setState(() {
              widget.npage.value=n;
            });
          },
          child: TexteAvecStyle(
            string,
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
    );
  }
}
