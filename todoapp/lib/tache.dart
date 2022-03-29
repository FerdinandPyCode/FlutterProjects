import 'dart:core';

class Todo {
  final int id;
  final String titre;
  final String description;
  final int dateenreg;
  final int datebegin;
  final int dateend;
  final int status;
  Todo({required this.id,required this.titre,required this.description,required this.dateenreg,required this.datebegin,required this.dateend,required this.status});

  Map<String, dynamic> toMap() {
    var map = <String,Object?>{
      "titre": titre,
      "description":description,
      "dateenreg":dateenreg,
      "datebegin":datebegin,
      "dateend":dateend,
      "status":status,
      'id':id,
    };
    return map;
  }

    Todo.fromMap(Map<String, dynamic> res)
      : id =/* (res["id"]==null) ? 0 :*/ res["id"],
        titre = res["titre"],
        description = res["description"],
        datebegin = res["datebegin"],
        dateend = res["dateend"],
        dateenreg = res["dateenreg"],
        status = res["status"];
  
  @override
  String toString() {
    return 'todo{id: $id, titre : $titre, description:$description,datebegin:$datebegin,dateend:$dateend,dateenreg:$dateenreg,status:$status}';
  }

}