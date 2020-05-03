import 'package:flutter/material.dart';


class SavedRecipes extends StatefulWidget{
  @override
  SavedRecipesState createState(){
    return new SavedRecipesState();
  }
}

class SavedRecipesState extends State<SavedRecipes>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text("Saved Recipes"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.done),
              title: Text("Chicken fried rice"),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text("Fried Chicken"),
            ),
          ],
        ),
      );
  }
}