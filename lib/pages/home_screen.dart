import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_cook/pages/Setup/signIn.dart';
import 'package:i_cook/pages/ingredient.dart';
import 'package:i_cook/pages/saved_recipes.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeScreenState createState()=>new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int navBarIndex = 0;

  void selectPage(int index)
  {
    setState(() {
      if(index == 0)
      {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else if (index == 2)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SavedRecipes()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              width: 350.0,
              left: 40.0,
              top: MediaQuery.of(context).size.height / 20,
              child: Column(children: <Widget>[
                Container(width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/250?image=9"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(70.0))
                ),),
                SizedBox(height: 20.0),
                Text(
                  "${widget.user.email}",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(height: 15.0),
                RaisedButton(
                      color: Colors.grey,
                    child: Text(
                        "log out",
                        style: TextStyle(fontSize: 10.0, color: Colors.black,)
                    ),
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                        SigninPage()),
                      );
                    }
                ),
                SizedBox(height: 15.0),
                RaisedButton(
                      color: Colors.deepPurpleAccent,
                    child: Text(
                        "My Ingredients",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white,)
                    ),
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                        Ingredient()),
                      );
                    }
                ),
              ],
              ),
            ),
          ],
        ),
      );
  }
}