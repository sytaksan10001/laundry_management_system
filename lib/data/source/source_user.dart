import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_management_system/data/model/user.dart';

class SourceUser {
  static final _dbRef = FirebaseFirestore.instance.collection('Admin');

  static Future<User?> Login(String username, String password) async {
    final result = await _dbRef
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get();
    if (result.size > 0) {
      return result.docs.map((e) => User.fromJson(e.data())).toList()[0];
    }
    return null;
  }
}
