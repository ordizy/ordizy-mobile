import 'package:flutter/material.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:ordizy/models/UserModel.dart';
import 'package:ordizy/screens/wrapper.dart';
import 'package:ordizy/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
        initialData: UserModel(uid:""),
        value: AuthServices().user,
        child: MaterialApp(
          home: Wrapper(),
        ),
    );
  }
}



