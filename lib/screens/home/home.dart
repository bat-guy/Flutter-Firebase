import 'package:flutter/material.dart';
import 'package:flutter_firebase/common/constants.dart';
import 'package:flutter_firebase/models/brew.dart';
import 'package:flutter_firebase/screens/home/brew_list.dart';
import 'package:flutter_firebase/screens/home/settings_form.dart';
import 'package:flutter_firebase/services/auth_service.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String uid;
  Home({super.key, required this.uid});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: const SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>?>.value(
        initialData: null,
        value: DatabaseService(uid: uid).brews,
        child: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            title: Text(Strings.home),
            backgroundColor: Colors.brown[700],
            elevation: 0,
            actions: [
              TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: const Icon(Icons.person),
                label: Text(Strings.logout),
                style: ButtonStyle(
                  iconColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                ),
              ),
              TextButton.icon(
                onPressed: () => showSettingsPanel(),
                icon: const Icon(Icons.settings),
                label: Text(Strings.settings),
                style: ButtonStyle(
                  iconColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                ),
              )
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.coffeeBg),
                fit: BoxFit.cover,
              ),
            ),
            child: const BrewList(),
          ),
        ));
  }
}
