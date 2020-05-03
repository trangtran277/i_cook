import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_cook/pages/recipe.dart';
import 'package:i_cook/pages/search_recipe.dart';

import 'home_screen.dart';

class SavedRecipes extends StatefulWidget{

  @override
  _SavedRecipesState createState(){
    return new _SavedRecipesState();
  }
}

class _SavedRecipesState extends State<SavedRecipes>{
  String recipeName;
  int navBarIndex = 2;

  void selectPage(int index)
  {
    setState(() {
      if(index == 0)
      {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else if (index == 1)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
         bottomNavigationBar: new BottomNavigationBar(
           currentIndex: navBarIndex,
           onTap: (int index)
           {
             setState(() {
               navBarIndex = index;
               selectPage(index);
             });
           },
           items: [
             new BottomNavigationBarItem(
               icon: ImageIcon(
                 AssetImage("https://picsum.photos/250?image=9"),
                 size: 0,
               ),
               title: Text('Home', textScaleFactor: 1.5,),
             ),
             new BottomNavigationBarItem(
               icon: ImageIcon(
                 AssetImage("https://www.iconspng.com/images/person-icon/person-icon.jpg"),
                 size: 0,
               ),
               title: Text('Search', textScaleFactor: 1.5,),
             ),
             new BottomNavigationBarItem(
               icon: ImageIcon(
                 AssetImage("https://www.iconspng.com/images/person-icon/person-icon.jpg"),
                 size: 0,
               ),
               title: Text('Saved Recipes', textScaleFactor: 1.5,),
             ),
           ],
         ),
        body: new Stack(
          children: <Widget>[
            Positioned(
              child: Column(children: <Widget>[
                Container(height: 50,
                  width: 500,
                  margin: EdgeInsets.only(left: 50, right: 50, top: 50),
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
                ),
                  SizedBox(height: 10.0,),
                  Container(height: 50,
                    width: 500,
                    margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                    child: RaisedButton(
                      color: Colors.lightBlueAccent,
                      child: Text(
                        "Fried Chicken",
                        style: TextStyle(fontSize: 25.0, color: Colors.black,)
                        ),
                        onPressed:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                            Recipe("Fried Chicken")),
            );
           }
        )
      )
              ],)
            )
          ],
        )
    );
  }
}