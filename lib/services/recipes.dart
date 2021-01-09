import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pics/data_objects/recipeDTO.dart';

class RecipesService {
  static const _baseUrl = 'https://api.edamam.com/search';
  static const _appId = '23c32844';
  static const _appKey = 'd9b07acad1e1eb0ebe5676da0a8e6f90';

  Future<RecipeDTO> responseToDTO(http.Response response) async {
    if (response.statusCode == 200) {
      return RecipeDTO.fromJson(jsonDecode(response.body));
    }
  }

  Future<List<RecipeDTO>> getRecipes(String searchParam) async {
    final response = await getRecipe(searchParam);
    var recipes = jsonDecode(response.body)['hits'];
    return recipes
        .map<RecipeDTO>((item) => RecipeDTO.fromJson(item['recipe']))
        .toList();
  }

  Future<String> test(String searchParam) async {
    await this.getRecipes(searchParam);
    final response = await getRecipe(searchParam);
    var recipe = jsonDecode(response.body)['hits'][0]['recipe'];
    return (RecipeDTO.fromJson(recipe)).label;
  }

  Future<http.Response> getRecipe(String searchParam) {
    return http.get(Uri.https('api.edamam.com', '/search', {
      'app_id': _appId,
      'app_key': _appKey,
      'q': searchParam,
    }));
  }

  Future<String> getRecipeString(String searchParam) async {
    var recipes = await this.getRecipe(searchParam);
    return recipes.body;
  }
}
