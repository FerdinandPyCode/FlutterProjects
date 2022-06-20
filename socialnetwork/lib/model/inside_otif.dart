import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialnetwork/util/constants.dart';
import 'package:socialnetwork/util/date_handler.dart';

class InsideNotif{
  late DocumentReference reference;
  late String text;
  late String date;
  late String userId;
  late DocumentReference aboutRef;
  late bool seen;
  late String type;

  InsideNotif(DocumentSnapshot snap){
    reference = snap.reference;
    Map<String,dynamic> map = snap.data() as Map<String,dynamic>;
    text = map[textKey];
    print("------------------------------------------$map");
    print(DateHandler().myDate(map[dateKey]));
    print("------------------------------------------");
    date = DateHandler().myDate(map[dateKey]);
    userId = map[uidKey];
    aboutRef = map[refKey];
    seen = map[seenKey];
    type = map[typeKey];
  }

}