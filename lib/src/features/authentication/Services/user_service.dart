import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_spark/src/features/authentication/models/user_model.dart';

class UserService {
  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) {
    return _db
        .collection("Users")
        .add(user.toJson())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
