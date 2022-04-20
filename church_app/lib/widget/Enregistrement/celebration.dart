import 'package:church_app/widget/custom_widget/input_widget.dart';
import 'package:flutter/material.dart';

import 'package:church_app/texteavecstyle.dart';

class Celebration extends StatefulWidget {
  const Celebration({ Key? key }) : super(key: key);

  @override
  State<Celebration> createState() => _CelebrationState();
}

class _CelebrationState extends State<Celebration> {


  // Variable de la page d'enregistrement d'une célébration
  String nameClient="";
  var listCategory=["Messe d'action de grâce","Messe en l'honneur","Messe pour les defunts des famille","Messe pour le repos de l'âme","Messe simple","Messe Veillée"];
  String lieuCelebration="";
  var dateCelebration=0;
  String heureCelebration="";
  int montant=0;
  var listModePaiement=["Espèce","Mobile Money","Chèque"];
  var listLieuPaiement=["Eglise","Chappelle","Maison"];
  final _formKey = GlobalKey<FormState>();


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
            "Enregistrement  >  Célébration",
            fontSize: 30.0,
            color: Colors.white,
            ),
          ),
          Expanded(
          child: SingleChildScrollView(
          child:Container(
          //padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,right: MediaQuery.of(context).size.width*0.2),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                
                const SizedBox(height: 30.0,),
                const Text(
                  "Nom du client",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0
                    ),
                  ),
                //const SizedBox(height: 2.0,),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer le nom du client svp !';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Entrer le nom du client',
                  ),
                  onChanged: (value) {
                    setState(() {
                      //firstname = value;
                    }
                    );
                  },
                ),
                
                const SizedBox(height: 20.0,),
                const Text(
                  "Prénom du client",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0
                    ),
                  ),
                //const SizedBox(height: 10.0,),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez le(s) prénoms du client svp !';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Entrez le(s) prénom(s) du client',
                  ),
                  onChanged: (value) {
                    setState(() {
                      //lastname = value;
                    });
                  },
                ),

                const SizedBox(height: 20.0,),
                const Text(
                  "Catégorie d'intension",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0
                    ),
                  ),
                //const SizedBox(height: 10.0,),
                DropdownButton(
                  // Initial Value
                  value:listCategory[0],
                    
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),    
                    
                  // Array list of items
                  items: listCategory.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) { 
                    setState(() {
                      //dropdownvalue = newValue!;
                      //gender=dropdownvalue;
                    });
                  },
              ),

                const SizedBox(height: 20.0,),
                const Text(
                  "Lieu de célébration",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0
                    ),
                  ),
                //const SizedBox(height: 10.0,),
                DropdownButton(
                  // Initial Value
                  value:listLieuPaiement[0],
                    
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),    
                    
                  // Array list of items
                  items: listLieuPaiement.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Wrap(children: [Text(items)]),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) { 
                    setState(() {
                      //dropdownvalue = newValue!;
                      //gender=dropdownvalue;
                    });
                  },
              ),

                const SizedBox(height: 20.0,),

                const Text(
                "Date",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0
                  ),
                ),
                
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez la prénoms du client svp !';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'dd/mm/yyy',
                    suffix: IconButton(
                      highlightColor: Colors.blue,
                      onPressed:(() => montrerPicker(0)),
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                        ),
                      ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      //lastname = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0,),
                const Text(
                "Heure",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0
                  ),
                ),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez l\'heure svp !';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'hh:mm',
                    suffix: IconButton(
                      highlightColor: Colors.blue,
                      onPressed: ()async{
                        var timeOfDay = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                      },
                      icon: const Icon(
                        Icons.lock_clock_outlined,
                        color: Colors.blue,
                        ),
                      ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      //lastname = value;
                    });
                  },
                ),

                const SizedBox(height: 20.0,),
                const Text(
                  "Montant",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0
                    ),
                  ),
                //const SizedBox(height: 10.0,),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez le montant svp !';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Entrez le montant',
                  ),
                  onChanged: (value) {
                    setState(() {
                      //lastname = value;
                    });
                  },
                ),
                  const SizedBox(height: 22.0,),
                const Text(
                  "Mode de paiement",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0
                    ),
                  ),
                //const SizedBox(height: 10.0,),
                DropdownButton(
                  // Initial Value
                  value:listModePaiement[0],
                    
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),    
                    
                  // Array list of items
                  items: listModePaiement.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Wrap(children: [Text(items)]),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) { 
                    setState(() {
                      //dropdownvalue = newValue!;
                      //gender=dropdownvalue;
                    });
                  },
              ),


              const SizedBox(height: 30.0,),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      /*if(date==""){
                        setState(() {
                          msg="Error";
                        });
                      }else{
                          await DatabaseHandler()
                            .insertpeople(Human(
                            firstname: firstname,
                            lastname: lastname,
                            id: Random().nextInt(50),
                            birthday: birthday,
                            adress: adress,
                            phone: phone,
                            mail: mail,
                            gender: gender,
                            picture: picture,
                            citation: citation
                            ))
                            .whenComplete(() => Navigator.pop(context)
                        );
                      }*/
                      //print("click !!!!!!!!!!!!!!!");
          
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content:Text('Processing Data')),
                      );
                    }
                  },
                  child:TexteAvecStyle(
                    "Enregistrer",
                    fontSize: 20.0,
                    color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      animationDuration:const Duration(milliseconds: 1000),
                      alignment: Alignment.center,
                      fixedSize:const Size(220, 50),
                      primary: Colors.red[300],
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      textStyle:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                ),
                const SizedBox(height: 30.0,),
              ],
            ),
          ),
        ),
            )
          )
      ],
    );

  }
    Future montrerPicker(int n) async {
    DateTime? choix = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
      //initialDatePickerMode: DatePickerMode.year,
    );

    if (choix != null) {
        setState(() {
          //date=choix.toString().substring(0,11);
          //birthday = Converter.dateToInt(choix.toString());
        });
    }
  }
}