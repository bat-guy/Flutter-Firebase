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
              PopupMenuButton(
                onSelected: (value) async {
                  value == 0 ? _auth.signOut() : showSettingsPanel();
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(Strings.logout),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(Strings.settings),
                  ),
                ],
              ),
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
