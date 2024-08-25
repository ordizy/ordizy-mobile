import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ordizy/models/UserModel.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  Future<String?> registerWithEmailPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required bool isBuyer,
  }) async {
    try {
      // Check if the email is already in use
      final userEmail = await _firestore.collection('users').where('email', isEqualTo: email).get();
      if (userEmail.docs.isNotEmpty) {
        return 'Email is already in use';
      }

      // Check if the phone number is already in use
      final userDoc = await _firestore.collection('users').where('phoneNumber', isEqualTo: phoneNumber).get();
      if (userDoc.docs.isNotEmpty) {
        return 'Phone number is already in use';
      }

      // Create the user
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'Name': name,
          'phoneNumber': phoneNumber,
          'email': email,
          'role': isBuyer ? 'buyer' : 'seller',
        });

        print('User registered and data saved to Firestore: ${user.uid}');
      }

      return null; // Return null to indicate no error
    } catch (e) {
      print('Error: ${e.toString()}');
      return 'Registration failed. Please try again.';
    }
  }

  Future<UserModel?> signInUsingEmailAndPassword(String email, String password) async {
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

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (err) {
      print('This is the error: ${err.toString()}');
    }
  }
}
