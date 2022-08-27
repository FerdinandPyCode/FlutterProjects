
import 'package:socialnetwork/util/constants.dart';
import 'package:socialnetwork/util/date_handler.dart';

class MemberComment {

  late String memberId;
  late String text;
  late String date;

  MemberComment(Map<String, dynamic> map) {
    memberId = map[uidKey];
    text = map[textKey];
    date = DateHandler().myDate(map[dateKey]);
  }
}