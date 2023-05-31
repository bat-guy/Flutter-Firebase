import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class SignIn extends StatefulWidget {
  final Function() toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        elevation: 0,
        title: Text('Sign In'),
        actions: [
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: Icon(Icons.person),
            label: Text('Register'),
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
              iconColor: MaterialStateColor.resolveWith((states) => Colors.white),
            ),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) {
                      setState(() => _email = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => _password = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      print('EMail - $_email, Password - $_password');
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade900)),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ))),
    );
  }
}
