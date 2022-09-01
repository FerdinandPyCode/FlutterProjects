class SushiModel {
  final String title;
  final String desc;
  final String price;
  final String image;

  SushiModel(this.title, this.desc, this.price, this.image);

  static List<SushiModel> list = [
    SushiModel("Sushi Ebi", "Rice + Ebi", "6.50", "assets/ebi.png"),
    SushiModel("Sushi Salmon", "Rice + Salmon", "8.50", "assets/salmon.png"),
    SushiModel("Sushi Sushi", "Rice + Sushi", "9.25", "assets/sushi.png"),
    SushiModel("Sushi Tomago", "Rice + Tomago", "4.50", "assets/tomago.png"),
    SushiModel("Sushi Tuna", "Rice + Tuna", "6.25", "assets/tuna.png"),
    SushiModel("Sushi Wasabi", "Rice + Wasabi", "6.50", "assets/wasabi.png"),
  ];
}
