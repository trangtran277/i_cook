import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_cook/pages/Setup/signIn.dart';

import '../home_screen.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onPressed: signUp,
              child: Text('Sign up'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    //validate fields
    final formState = _formKey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
        //user.sendEmailVerification();
        //display notification
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage(), fullscreenDialog: true));
      } catch(e){
        print(e.message);
      }
    }
    // login to firebase
  }
}
