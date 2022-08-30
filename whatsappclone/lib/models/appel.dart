import 'package:whatsappclone/models/appeldetails.dart';

class Appel{
  late int id;
  String name;
  String avatarUrl;
  List<AppelDetail> appelDetails;

  get dernierAppel => appelDetails[appelDetails.length-1];

  Appel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.appelDetails,
  });

  factory Appel.fromJson(Map<String, dynamic> json) {
    List<AppelDetail> appelDetails = json['appels'].map<AppelDetail>((i) => AppelDetail.fromJson(i)).toList();

    return Appel(
      id: json['id'],
      name: json['name'],
      avatarUrl: json['avatarPath'],
      appelDetails: appelDetails,
    );
  }
}