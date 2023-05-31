import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/auth/sigin_in.dart';
import 'package:flutter_firebase/screens/auth/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn ? SignIn(toggleView: toggleView) : RegisterState(toggleView: toggleView);
  }
}
