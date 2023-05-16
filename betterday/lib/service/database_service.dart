import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // reference for our collections
  final CollectionReference userCollection = 
    FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection = 
    FirebaseFirestore.instance.collection("groups");
  // updating the userdata
  Future savingUserData(String fullname, String email) async {
    return await userCollection.doc(uid).set({
      "fullname": fullname,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid,
    });
  }
  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot = 
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
