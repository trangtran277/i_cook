import 'package:flutter/material.dart';
import 'package:i_cook/pages/recipe.dart';

class SavedRecipes extends StatefulWidget{
  @override
  _SavedRecipesState createState(){
    return new _SavedRecipesState();
  }
}

class _SavedRecipesState extends State<SavedRecipes>{
  
  String recipeName;
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text("Saved Recipes"),
        ),
        body: Container(height: 50,
        width: 500,
                          margin: EdgeInsets.all(2),
                          child: RaisedButton(
                      color: Colors.lightBlueAccent,
                    child: Text(
                        "Chicken Stir Fried Rice",
                        style: TextStyle(fontSize: 25.0, color: Colors.black,)
                    ),
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                        Recipe("Chicken Stir Fried Rice")),
                      );
                    }
                )
      )               
    );
  }
}