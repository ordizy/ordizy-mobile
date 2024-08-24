import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ordizy/models/UserModel.dart';

class AuthServices {
  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a user from Firebase user with uid
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // Create the stream for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  // Sign in anonymously
  Future<UserModel?> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
  //Register using email and passsword
  Future registerWithEmailPassword(String email, String password, String Name, String phoneNumber) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      // Save the user data to Firestore
      await _firestore.collection('users').doc(user?.uid).set({
        'Name': Name,
        'phoneNumber': phoneNumber,
        'email': email,
      });

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//signin with email password
  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err);
      return null;
    }
  }

  //signOut

Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(err){
      print('This is the error: ${err.toString()}');
      return null;
    }
}


}


