import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/common/loading.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _sugars = ['0', '1', '2', '3', '4'];

  String _currentName = '';
  String _currentSugars = '';
  int? _currentStrength;

  double getSliderValue(UserData? userData) {
    if (_currentStrength != null) {
      return _currentStrength!.toDouble();
    } else if (userData?.strength != null) {
      return userData!.strength.toDouble();
    } else {
      return 100;
    }
  }

  String getSugarsData(UserData? data) {
    if (_currentSugars != '') {
      return _currentSugars;
    } else if (data?.sugars != null) {
      return data!.sugars;
    } else {
      return _sugars[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCred?>(context);

    return Form(
      key: _formKey,
      child: StreamBuilder<UserData>(
          stream: DatabaseService(uid: user?.uid ?? '').userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData? userData = snapshot.data;
              print(userData);
              return Column(
                children: [
                  Text(
                    Strings.updateYourBrewSettings,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: (userData?.name != null) ? userData?.name : '',
                    decoration: TextInputDeclaration.copyWith(hintText: Strings.name),
                    validator: (val) => val?.isEmpty == true ? Strings.enterName : null,
                    keyboardType: TextInputType.name,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: TextInputDeclaration,
                    value: getSugarsData(userData),
                    items: _sugars
                        .map((val) => DropdownMenuItem(
                              value: val,
                              child: Text(interpolate(Strings.placeHolderSugars, [val])),
                            ))
                        .toList(),
                    onChanged: (val) => _currentSugars = val ?? '',
                  ),
                  const SizedBox(height: 20),
                  Slider(
                    min: 100,
                    max: 900,
                    divisions: 8,
                    value: getSliderValue(userData),
                    onChanged: (val) => setState(() => _currentStrength = val.round()),
                    activeColor: Colors.brown[getSliderValue(userData).toInt()],
                    inactiveColor: Colors.brown[100],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      print('BottomSheet ------ $_currentName, $_currentSugars, $_currentStrength');
                      if (_formKey.currentState?.validate() == true) {
                        await DatabaseService(uid: user!.uid).updateUserData(
                          _currentSugars.isEmpty ? userData!.sugars : _currentSugars,
                          _currentName.isEmpty ? userData!.name : _currentName,
                          _currentStrength ?? userData!.strength,
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.resolveWith((states) => 7),
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red.shade600),
                        padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(horizontal: 40, vertical: 9))),
                    child: Text(
                      Strings.update,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              );
            } else {
              return const Loading(backgroundColor: Colors.white);
            }
          }),
    );
  }
}
