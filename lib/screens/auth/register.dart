import 'package:flutter/material.dart';
import 'package:flutter_firebase/common/constants.dart';
import 'package:flutter_firebase/common/loading.dart';
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

  String _email = '';
  String _password = '';
  String _error = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading(backgroundColor: Colors.deepPurple)
        : Scaffold(
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
                          decoration: TextInputDeclaration.copyWith(hintText: 'Email'),
                          validator: (val) => val?.isEmpty == true ? 'Enter an email' : null,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) {
                            setState(() => _email = val);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: TextInputDeclaration.copyWith(hintText: 'Password'),
                          validator: (val) => (val == null || val.length < 6) ? 'Enter a password 6+ character long' : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => _password = val);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() == true) {
                              setState(() => _loading = true);
                              dynamic result = await _auth.registerWithEmailPass(_email, _password);
                              if (result == null) {
                                setState(() {
                                  _error = 'Supply legal email';
                                  _loading = false;
                                });
                              }
                            }
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade900)),
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(_error, style: TextStyle(color: Colors.red, fontSize: 14))
                      ],
                    ))),
          );
  }
}
