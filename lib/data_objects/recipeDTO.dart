import 'IngredientsDTO.dart';

class RecipeDTO {
  final String uri;
  final String label;
  final String image;
  final String source;
  final String url;
  final String shareAs;
  final List<String> dietLabels;
  final List<String> healthLabels;
  final List<String> cautions;
  final List<String> ingredientLines;
  final List<IngredientsDTO> ingredients;

  RecipeDTO(
      {this.uri,
      this.label,
      this.image,
      this.source,
      this.url,
      this.shareAs,
      this.dietLabels,
      this.healthLabels,
      this.cautions,
      this.ingredientLines,
      this.ingredients});

  factory RecipeDTO.fromJson(Map<String, dynamic> json) {
    List<IngredientsDTO> ingredients = json['ingredients']
        .map<IngredientsDTO>((item) => IngredientsDTO.fromJson(item))
        .toList();

    return RecipeDTO(
        uri: json['uri'],
        label: json['label'],
        image: json['image'],
        source: json['source'],
        url: json['url'],
        shareAs: json['shareAs'],
        dietLabels: json['dietLabels'].cast<String>().toList(),
        healthLabels: json['healthLabels'].cast<String>().toList(),
        cautions: json['cautions'].cast<String>().toList(),
        ingredientLines: json['ingredientLines'].cast<String>().toList(),
        ingredients: ingredients);
  }
}
