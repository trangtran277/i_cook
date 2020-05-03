import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_cook/pages/home_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
          //Implement fields
            TextFormField(
              validator: (input){
                if (input.isEmpty){
                  return 'Email missing!';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextFormField(
              validator: (input){
                if (input.isEmpty){
                  return 'Password missing!';
                }
                else if (input.length < 8){
                  return 'Please enter a password with length 8 or more';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    //validate fields
    final formState = _formKey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }catch(e){
        print(e.message);      }

    }
    // login to firebase
  }
}
