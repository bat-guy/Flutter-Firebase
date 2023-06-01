import 'package:flutter/material.dart';

const TextInputDeclaration = InputDecoration(
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
String interpolate(String string, List l) {
  Iterable<RegExpMatch> matches = exp.allMatches(string);

  assert(l.length == matches.length);

  var i = -1;
  return string.replaceAllMapped(exp, (match) {
    print(match.group(0));
    i = i + 1;
    return '${l[i]}';
  });
}

class Strings {
  static String settings = 'Settings';
  static String logout = 'Logout';
  static String home = 'Home';
  static String takesPlaceholderSugars = 'Takes %s sugar(s)';
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
  static String placeHolderSugars = '%s Sugars';
  static String update = 'UPDATE';
}

class Assets {
  static String coffeeBg = 'assets/coffee_bg.png';
  static String coffeeIcon = 'assets/coffee_icon.png';
}
