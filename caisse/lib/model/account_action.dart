import 'package:caisse/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Action{
  late String uid;
  late String action;
  late double amount;
  late String description;
  late int? date;

  late DocumentReference ref;
  late String documentId;

  Action(DocumentSnapshot snapshot) {
    ref = snapshot.reference;
    uid = snapshot.id;
    Object? datas = snapshot.data();
    datas = datas as Map;

    amount=datas[amountKey];
    action = datas[actionKey];
    description=datas[descriptionKey];
    date = datas[dateKey];
  }

  Map<String,dynamic> toMap() {
    return {
      uidKey: uid,
      amountKey: amount,
      actionKey: action,
      descriptionKey: description,
      dateKey: date,
    };
  }
}