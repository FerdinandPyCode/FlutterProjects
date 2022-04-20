import 'package:church_app/texteavecstyle.dart';
import 'package:flutter/material.dart';

class Personnels extends StatefulWidget {

  
  ValueNotifier<int> npage= ValueNotifier(0);
  Personnels({ Key? key,required npage }) : super(key: key);

  @override
  State<Personnels> createState() => _PersonnelsState();
}

class _PersonnelsState extends State<Personnels> {
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
            "Personnels",
            fontSize: 30.0,
            color: Colors.white,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  btnOption("Ajouter", 13),
                  btnOption("Liste du personnel", 20),
                ],
              ) ,
              )
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