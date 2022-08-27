import 'package:flutter/material.dart';
import 'web1.dart';
import 'package:generate_pdf_file/mobile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
    return Center(
      child: ElevatedButton(child:Text("Create a PDF"),onPressed: createPdf,),
    );
  }

  Future<void> createPdf() async{
    PdfDocument document = PdfDocument();

    final PdfPage page = document.pages.add();
    
   /* const String paragraphText ="\tNous responsables de ’ %1 de l'Agence Belge de Développement Enabel au Bénin, ordonnons à : %2"
                                "\n\nTitulaire du permis de conduire No %3 du %4   délivré à %5"
                                "\n\nDe se rendre en mission à %6   pour assurer le déplacement de %7  dans le cadre de  %8 "
                                "\n\nDu %9   au %10;	"
                                "\n\n\nA bord du véhicule de service du Projet dont les caractéristiques sont les suivantes :"
                                "\n\nMARQUE		                    : %11"
                                "\nNoCHASSIS		                :%12"
                                "\nNoIMMATRICULATION      :%13"
                                "\n\n\n\n\n\n                                                                                                                                       %14"
                                "\n\n\n\n%15				                  		%16"
                                "\n\n\n\n%17			                  			%18";*/
      
      const String paragraphText ="\tJe soussigné, %13, Représentant Résident de l'Agence Belge de Développement, Enabel au Bénin, ordonne à :"
      "\n %2  %3;"
      "\n\nDe se rendre en mission à %4 dans le cadre de %5"
      "\n\nDu %6 au %7;"
      "\n\n\nA bord  du véhicule de fonction du projet dont les caractéristiques sont les suivantes :"
      "\n\nMARQUE		                    : %11"
      "\nNoCHASSIS		                :%12"
      "\nNoIMMATRICULATION      :%13"
      "\n\n\n\n\n\n%13\n%14";


      final PdfLayoutResult layoutResult = PdfTextElement(
        text: paragraphText,
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0))
      )
      .draw(
          page: page,
          bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height),
          format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;

    

    List<int> bytes = await document.save();

    document.dispose();
    saveAndLaunchFile(bytes,'output1.pdf');

  }
}
