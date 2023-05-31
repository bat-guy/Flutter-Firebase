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

  Future registerWithEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
