import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/brew.dart';
import 'package:flutter_firebase/screens/home/brew_list.dart';
import 'package:flutter_firebase/services/auth_service.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String uid;
  Home({super.key, required this.uid});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
        initialData: null,
        value: DatabaseService(uid: uid).brews,
        child: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            title: Text('Home'),
            backgroundColor: Colors.brown[700],
            elevation: 0,
            actions: [
              TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout'),
                style: ButtonStyle(
                  iconColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                ),
              )
            ],
          ),
          body: BrewList(),
        ));
  }
}
