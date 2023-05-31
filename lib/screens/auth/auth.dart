import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/auth/sigin_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: SignIn());
  }
}
