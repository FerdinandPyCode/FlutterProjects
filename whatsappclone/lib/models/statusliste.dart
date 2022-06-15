import 'dart:convert';
import 'package:whatsappclone/models/status.dart';

StatusList statusListFromJson(String str) {
  final jsonData = json.decode(str);
  return StatusList.fromJson(jsonData);
}

class StatusList {
  List<Status> statuses;

  StatusList({
    required this.statuses,
  });

  factory StatusList.fromJson(List<dynamic> json) {
    List<Status> statuses = json.map<Status>((i) => Status.fromJson(i)).toList();

    return StatusList(
      statuses: statuses,
    );
  }
}