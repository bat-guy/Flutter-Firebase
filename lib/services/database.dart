import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/brew.dart';
import 'package:flutter_firebase/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference collection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugar, String name, int strength) async {
    return await collection.doc(uid).set({'sugars': sugar, 'name': name, 'strength': strength});
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    List<Brew> list = [];
    try {
      snapshot.docs.forEach((e) {
        list.add(Brew(
          name: e.get('name') ?? '',
          sugar: e.get('sugars') ?? '0',
          strength: e.get('strength') ?? 0,
        ));
      });
    } catch (e) {
      print(e);
    }
    return list;
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapShot) {
    return UserData(uid: uid, name: snapShot['name'], sugars: snapShot['sugars'], strength: snapShot['strength']);
  }

  Stream<List<Brew>?> get brews {
    return collection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return collection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
