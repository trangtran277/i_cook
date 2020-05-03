import 'package:flutter/material.dart';
import 'package:i_cook/pages/saved_recipes.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController nameController = TextEditingController();
  int navBarIndex = 1;

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
        body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search by recipe name',
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("or Pick ingredients to start", 
              style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 10,), 
            ]
        )
    );
  }
}