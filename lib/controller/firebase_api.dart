import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static bool isUpdate = false;

  static String selectedKey = '';

  static final DatabaseReference db = FirebaseDatabase.instance.ref('User');

  static Future<void> setUserData({required String userrName}) async {
    String key = db.push().key!;
    await db.child(key).set({'key': key, 'userName': userrName});
  }

  // static Future<List<Map>> selectData() async {
  //   Map data = await db.once().then((value) => value.snapshot.value as Map);
  //   List<Map> userData = [];
  //   data.forEach((key, value) {
  //     userData.add(value);
  //   });
  //   return userData;
  // }

  static Future<List<Map>> selectData() async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    return userData;
  }

  // static Future<void> updateData(
  //     {required String key, required String userName}) async {
  //   await db.child(key).set(
  //     {
  //       'key': key,
  //       'userName': userName,
  //     },
  //   );
  // }

  static Future<void> updateData(
      {required String key, required String userName}) async {
    await db.child(key).update(
      {
        'key': key,
        'userName': userName,
      },
    );
  }

  static Future<void> deleteData({required String key}) async {
    await db.child(key).remove();
  }

}
