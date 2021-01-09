import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'services/recipes.dart';
import 'data_objects/recipeDTO.dart';

class TopRecipes extends StatefulWidget {
  TopRecipes({Key key}) : super(key: key);

  @override
  _TopRecipesState createState() => _TopRecipesState();
}

class _TopRecipesState extends State<TopRecipes> {
  void getRecipes() {}

  Future<List<RecipeDTO>> _recipes = RecipesService().getRecipes('coffe');

  Container horizontaList(RecipeDTO recipes) {
    return Container(
      height: 30,
      width: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(recipes.healthLabels.length, (index) {
          // return Chip(
          //   label: Text(recipes.healthLabels[index]),
          // );
          return Padding(
            padding: EdgeInsets.only(right: 5),
            child: Chip(label: Text(recipes.healthLabels[index])),
          );
        }),
      ),
    );
  }

  List<Widget> buildRecipesList(List<RecipeDTO> recipes) {
    return recipes
        .map<Widget>((recipe) => Center(
                child: Card(
              child: ListTile(
                leading: Icon(Icons.access_time),
                title: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(recipe.label),
                ),
                subtitle: this.horizontaList(recipe),
                contentPadding: EdgeInsets.only(bottom: 5),
              ),
            )))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<RecipeDTO>>(
        future: _recipes,
        builder:
            (BuildContext context, AsyncSnapshot<List<RecipeDTO>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = this.buildRecipesList(snapshot.data);
            return ListView(
              children: children,
              shrinkWrap: true,
            );
          } else if (snapshot.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children),
            );
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children),
            );
          }
        },
      ),
    );
  }
}
