import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
