import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        elevation: 0,
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: TextButton(
          onPressed: () async {
            User? result = await _auth.signInAnon();
            if (result == null) {
              print('Error Signing In');
            } else {
              print('Signed in');
              print(result.uid);
            }
          },
          child: Text('Sign In Anon'),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
            elevation: MaterialStateProperty.resolveWith((states) => 5),
          ),
        ),
      ),
    );
  }
}
