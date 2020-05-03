import 'package:flutter/material.dart';

class Recipe extends StatelessWidget{
  
  final String recipeName;
  
  Recipe(this.recipeName);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(recipeName),
      ),
      body: Text("HOW TO COOK")
    );
  }
}