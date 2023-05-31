import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/screens/auth/auth.dart';
import 'package:flutter_firebase/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final Stream<UserCred?>? user;

  const Wrapper({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCred?>(context);
    print(user);

    return user == null ? Authenticate() : Home(uid: user.uid);
  }
}
