import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'defaultActions.dart';
import 'topRecipes.dart';

class RecipesApp extends StatelessWidget {
  final String _title = 'Recipes App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: DefaultActions.actions,
          backgroundColor: Color(0xffe67e22),
        ),
        body: TopRecipes(),
        drawer: Drawer(
          child: Scaffold(
            appBar: AppBar(
              title: Text('aaa'),
            ),
          ),
        ),
      ),
    );
  }
}
