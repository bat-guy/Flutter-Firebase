import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class RegisterState extends StatefulWidget {
  final Function() toggleView;
  const RegisterState({super.key, required this.toggleView});

  @override
  State<RegisterState> createState() => _RegisterStateState();
}

class _RegisterStateState extends State<RegisterState> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        elevation: 0,
        title: Text('Register'),
        actions: [
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: const Icon(Icons.person),
            label: Text('Sign In'),
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
                    validator: (val) => val?.isEmpty == true ? 'Enter an email' : null,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (val) => (val == null || val.length < 6) ? 'Enter a password 6+ character long' : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() == true) {
                        dynamic result = await _auth.registerWithEmailPass(email, password);
                        if (result == null) {
                          setState(() => error = 'Supply legal email');
                        }
                        print('YAAAA');
                      } else {
                        print('NOOOOO');
                      }
                      ;
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade900)),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(error, style: TextStyle(color: Colors.red, fontSize: 14))
                ],
              ))),
    );
  }
}
