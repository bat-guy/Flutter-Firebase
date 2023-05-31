import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class RegisterState extends StatefulWidget {
  const RegisterState({super.key});

  @override
  State<RegisterState> createState() => _RegisterStateState();
}

class _RegisterStateState extends State<RegisterState> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        elevation: 0,
        title: Text('Register'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Form(
              child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  print('EMail - $email, Password - $password');
                },
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade900)),
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ))),
    );
  }
}
