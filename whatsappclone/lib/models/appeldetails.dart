class AppelDetail{
  bool isIncoming;
  bool isMissed;
  DateTime timestamp;

  AppelDetail({
    required this.isIncoming,
    required this.isMissed,
    required this.timestamp,
  });

  factory AppelDetail.fromJson(Map<String, dynamic> json) {
    return AppelDetail(
      isIncoming: json['isIncoming'],
      isMissed: json['isMissed'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}