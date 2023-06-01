import 'package:flutter/material.dart';

const textInputDeclaration = InputDecoration(
    hintText: 'Password',
    fillColor: Color(0xFFB2EBF2),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFB2EBF2), width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 239, 88, 88), width: 2),
    ));

const needleRegex = r'{#}';
const needle = '{#}';
final RegExp exp = new RegExp(needleRegex);

//Function that formats strings with the given values
String interpolate(String string, List params) {
  String result = string;
  for (int i = 1; i < params.length + 1; i++) {
    result = result.replaceAll('%${i}\$', params[i - 1]);
  }

  return result;
}

class Strings {
  static String settings = 'Settings';
  static String logout = 'Logout';
  static String home = 'Home';
  static String takesPlaceholderSugars = 'Takes %1\$ sugar(s)';
  static String register = 'Register';
  static String signIn = 'Sign In';
  static String email = 'Email';
  static String enterAnEmail = 'Enter an email';
  static String password = 'Password';
  static String enterPassword = 'Enter a password 6+ character long';
  static String supplyLegalEmail = 'Supply legal email';
  static String couldNotSignIn = 'Couldn\'t Sign In';
  static String updateYourBrewSettings = 'Update your brew settings.';
  static String name = 'Name';
  static String enterName = 'Enter a name';
  static String placeHolderSugars = '%1\$ Sugars';
  static String update = 'UPDATE';
}

class Assets {
  static String coffeeBg = 'assets/coffee_bg.png';
  static String coffeeIcon = 'assets/coffee_icon.png';
}
