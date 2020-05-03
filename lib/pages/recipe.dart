import 'package:flutter/material.dart';

class Recipe extends StatelessWidget{
  
  final String recipeName;
  
  Recipe(this.recipeName);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(recipeName),
      ),
      body: How_to_Cook(recipeName)
    );
  }
}

Widget How_to_Cook(String recipeName)
{
  if(recipeName != "Chicken Stir Fried Rice")
  {
    return Text("How to cook");
  }
  
  return Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Text("Ingredients: Brown rice, Chicken breasts, Sesame oil, Vegetable oil, Frozone peas and carrots blend, Green onions, Garlic, Eggs, Soy sauce", 
              style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 20,), 
              Text("1. In a large non-stick wok or skillet, heat 1 1/2 tsp sesame oil and 1 1/2 tsp of the canola oil over medium-high heat", 
              style: TextStyle(fontSize: 20.0)),
              Text("2.Add chicken pieces, season lightly with salt and pepper and saute until cooked through, about 5 – 6 minutes.", 
              style: TextStyle(fontSize: 20.0)),
              Text("3.Transfer chicken to a plate or a piece of foil and set aside.", 
              style: TextStyle(fontSize: 20.0)),
            ]
        );
}