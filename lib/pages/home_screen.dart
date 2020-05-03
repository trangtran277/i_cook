import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_cook/pages/Setup/signIn.dart';
import 'package:i_cook/pages/ingridient.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeScreenState createState()=>new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                        "My Ingridients",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white,)
                    ),
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                        Ingridient()),
                      );
                    }
                ),

              ],)
            )
          ],
        )
      );
  }
}