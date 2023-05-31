import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserCred? _userFromFireBase(User? user) {
    return user != null ? UserCred(uid: user.uid) : null;
  }

  Stream<UserCred?> get user {
    return _auth.userChanges().map(_userFromFireBase);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
