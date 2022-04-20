
class Celebrations{
  int? id;
  String? nomClient;
  String? prenomClient;
  String? categorieIntension;
  String? lieuCelebration;
  int? dateCelebration;
  int? heureCelebration;
  int? montantCelebration;
  String? modeCelebration;

  Celebrations({
    required this.categorieIntension,
    required this.dateCelebration,
    required this.heureCelebration,
    required this.id,
    required this.lieuCelebration,
    required this.modeCelebration,
    required this.montantCelebration,
    required this.nomClient,
    required this.prenomClient
  });

  Celebrations.fromMap(Map<String,dynamic> map):
    id=map["id"],
    prenomClient=map["prenomClient"],
    categorieIntension=map["categorieIntension"],
    lieuCelebration=map["lieuCelebration"],
    dateCelebration=map["dateCelebration"],
    heureCelebration=map["heureCelebration"],
    montantCelebration=map["montantCelebration"],
    modeCelebration=map["modeCelebration"],
    nomClient=map["nomClient"];

  Map<String,dynamic> toMap(){
       return  {
        "id":id,
        "prenomClient":prenomClient,
        "categorieIntension":categorieIntension,
        "lieuCelebration":lieuCelebration,
        "dateCelebration":dateCelebration,
        "heureCelebration":heureCelebration,
        "montantCelebration":montantCelebration,
        "modeCelebration":modeCelebration,
        "nomClient":nomClient
    };
  }
}

class Depenses{
  int? id;
  String? descDepense;
  int? montantDepense;
  String? autDepensePar;
  int? dateDepense;

  Depenses({
    required this.id,
    required this.autDepensePar,
    required this.montantDepense,
    required this.dateDepense,
    required this.descDepense
  });

  Depenses.fromMap(Map<String,dynamic> map):
  autDepensePar=map["autDepensePar"],
  montantDepense=map["montantDepense"],
  dateDepense=map["dateDepense"],
  descDepense=map["descDepense"],
  id=map["id"];

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "autDepensePar":autDepensePar,
      "montantDepense":montantDepense,
      "dateDepense":dateDepense,
      "descDepense":descDepense,
    };
  }
}

class Ventes{
  int? id;
  String? objetDeVente;
  String? lieuDeVente;
  int? dateDeVente;
  int? heureDeVente;
  int? montantVente;

  Ventes({
    required this.id,
    required this.dateDeVente,
    required this.heureDeVente,
    required this.lieuDeVente,
    required this.montantVente,
    required this.objetDeVente
  });

  Ventes.fromMap(Map<String,dynamic> map):
  id=map["id"],
  heureDeVente=map["heureDeVente"],
  lieuDeVente=map["lieuDeVente"],
  objetDeVente=map["objetDeVente"],
  dateDeVente=map["dateDeVente"];

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "heureDeVente":heureDeVente,
      "objetDeVente":objetDeVente,
      "dateDeVente":dateDeVente,
      "lieuDeVente":lieuDeVente
    };
  }
}

class Quete{
  int? id;
  String? lieuDeCelebrationQuete;
  String? dateDeCelebrationQuete;
  String? heureDeCelebrationQuete;
  int? montantQuete;

  Quete(
    {
      required this.dateDeCelebrationQuete,
      required this.heureDeCelebrationQuete,
      required this.id,
      required this.lieuDeCelebrationQuete,
      required this.montantQuete
    }
  );

  Quete.fromMap(Map<String,dynamic> map): 
  id=map["id"],
  dateDeCelebrationQuete=map["dateDeCelebrationQuete"],
  heureDeCelebrationQuete=map["heureDeCelebrationQuete"],
  montantQuete=map["montantQuete"],
  lieuDeCelebrationQuete=map["lieuDeCelebrationQuete"];


  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "dateDeCelebrationQuete":dateDeCelebrationQuete,
      "heureDeCelebrationQuete":dateDeCelebrationQuete,
      "montantQuete":montantQuete,
      "lieuDeCelebrationQuete":lieuDeCelebrationQuete
    };
  }
}

class Toilette{
  int? id;
  int? date;
  int? montant;

  Toilette({
    required this.date,
    required this.id,
    required this.montant
  });

  Toilette.fromMap(Map<String,dynamic> map):
  id=map["id"],
  date=map["date"],
  montant=map["montant"];

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "date":date,
      "montant":montant
    };
  }
}

class AgentPastoraux{
  int? id;
  String? nomAgent;
  String? prenomAgent;
  int? dateNaissanceAgent;
  String? lieuNaissanceAgent;
  String? posteAgent;
  int? salaire;

  AgentPastoraux({
    required this.id,
    required this.nomAgent,
    required this.posteAgent,
    required this.prenomAgent,
    required this.lieuNaissanceAgent,
    required this.dateNaissanceAgent,
    required this.salaire
  });

  AgentPastoraux.fromMap(Map<String,dynamic> map): 
  id=map["id"],
  nomAgent=map["nomAgent"],
  posteAgent=map["posteAgent"],
  prenomAgent=map["prenomAgent"],
  lieuNaissanceAgent=map["lieuNaissanceAgent"],
  dateNaissanceAgent=map["dateNaissanceAgent"],
  salaire=map["salaire"];

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "nomAgent":nomAgent,
      "posteAgent":posteAgent,
      "prenomAgent":prenomAgent,
      "lieuNaissanceAgent":lieuNaissanceAgent,
      "dateNaissanceAgent":dateNaissanceAgent,
      "salaire":salaire
    };
  }
}