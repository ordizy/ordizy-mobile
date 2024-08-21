import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ordizy/models/UserModel.dart';

class AuthServices {
  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
Future registerWithEmailPassword(String email,String password)async{
  try{
    UserCredential result=await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user=result.user;
    return _userWithFirebaseUserUid(user);
  }catch(err){
    print(err.toString());
    return null;
  }
}



  //signOut

Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(err){
      print(err.toString());
      return null;
    }
}


}
