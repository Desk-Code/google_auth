import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('User');
  static Future<void> setUserData({required String userrName}) async {
    String key = db.push().key!;
    await db.child(key).set({'key': key, 'userName': userrName});
  }
}
