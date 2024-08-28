import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ordizy/models/UserModel.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Convert Firebase User to UserModel
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  // Register with Email and Password
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
          'name': name,
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

  // Sign in with Email and Password
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

  // Sign in with Google
  Future<UserModel?> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      // Sign out of Google to ensure account selection prompt
      await _googleSignIn.signOut();

      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        // Perform sign-in with the credentials
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          // Check if the user's email is already registered in your Firestore database
          final existingUser = await _firestore.collection('users').where('email', isEqualTo: user.email).get();

          if (existingUser.docs.isNotEmpty) {
            // The email is already registered, proceed with the sign-in
            return _userWithFirebaseUserUid(user);
          } else {
            // The email is not registered in the system
            // Automatically register the user with default values
            await _firestore.collection('users').doc(user.uid).set({
              'email': user.email,
              'role': 'buyer', // Default role, you can customize this
            });

            return _userWithFirebaseUserUid(user);
          }
        }
      }
    } catch (e) {
      print('Google Sign-In Error: ${e.toString()}');
      return null;
    }
    return null;
  }


  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      print('Sign Out Error: ${e.toString()}');
    }
  }

  // // Reset Password
  // Future<void> resetPassword(String email) async {
  //   try {
  //     await _auth.sendPasswordResetEmail(email: email);
  //   } catch (e) {
  //     print('Reset Password Error: ${e.toString()}');
  //   }
  // }
  //
  // // Update user profile
  // Future<void> updateUserProfile({required String name, required String phoneNumber}) async {
  //   try {
  //     User? user = _auth.currentUser;
  //     if (user != null) {
  //       await _firestore.collection('users').doc(user.uid).update({
  //         'name': name,
  //         'phoneNumber': phoneNumber,
  //       });
  //     }
  //   } catch (e) {
  //     print('Update Profile Error: ${e.toString()}');
  //   }
  // }
}
