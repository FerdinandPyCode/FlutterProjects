class todo {
  final int id;
  final String title;
  final String description;
  final int priority;
  final int beginDate;
  final int endDate;

  todo({
    required this.id,
    required this.title,
    required this.description,
    required this.beginDate,
    required this.endDate,
    required this.priority
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      "beginDate":beginDate,
      "endDate":endDate,
      "priority":priority
    };
  }

  todo.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["description"],
        priority=res["priority"],
        endDate=res["endDate"],
        beginDate=res["beginDate"];

  @override
  String toString() {
    return 'todo{id: $id, title: $title, description: $description ,beginDate: $beginDate, endDate: $endDate, priority: $priority}';
  }
}
