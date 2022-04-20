import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialnetwork/util/constants.dart';

class Post {
  late DocumentReference? ref;
  late String? documentId;
  late String? id;
  late String? memberId;
  late String? text;
  late String? imageUrl;
  late int? date;
  late List<dynamic>? likes;
  late List<dynamic>? comments;

  Post(DocumentSnapshot snapshot) {
    ref = snapshot.reference;
    documentId = snapshot.id;
    Object? datas = snapshot.data();
    datas = datas as Map;
    print("--------------->  Beginning");
    id = datas?[postIdKey];
    memberId = datas?[uidKey];
    text = datas?[textKey];
    imageUrl = datas?[imageUrlKey];
    date = datas?[dateKey];
    likes = datas?[likeKey];
    comments = datas?[commentKey];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      postIdKey: id,
      uidKey: memberId,
      likeKey: likes,
      commentKey: comments
    };
    if (text != null) {
      map[textKey] = text;
    }

    if (imageUrl != null) {
      map[imageUrlKey] = imageUrl;
    }
    return map;
  }
}
