class IngredientsDTO {
  final String text;
  final double weight;
  final String image;

  IngredientsDTO({this.text, this.weight, this.image});

  factory IngredientsDTO.fromJson(Map<String, dynamic> json) {
    return IngredientsDTO(
      text: json['text'],
      weight: json['weight'],
      image: json['image'],
    );
  }
}
