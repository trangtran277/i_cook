import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_cook/pages/Setup/signUp.dart';
import 'package:i_cook/pages/home_screen.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            ),
            RaisedButton(
              onPressed: signUp,
              child: Text('Create account'),
            ),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(user: user)));
      } catch(e){
        print(e.message);
      }
    }
    // login to firebase
  }

  void signUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(), fullscreenDialog: true));
  }
}
