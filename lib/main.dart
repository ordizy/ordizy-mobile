import 'package:flutter/material.dart';
import 'package:ordizy/screens/authentication/forgotPwd_phoneOtp.dart';
import 'package:ordizy/screens/authentication/register.dart';
import 'screens/authentication/sign_in.dart';
import 'screens/home.dart';
import 'screens/splash_screen.dart';
// Example of a home screen

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:ordizy/screens/wrapper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define your routes here
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(), // Default route
        '/fPwd_phoneOtp': (context) => ForgotpwdPhoneotp(),
        '/register': (context) => Register(),
         '/login': (context) => SignInPage(), // Example of a login route
        '/home': (context) => Home(), // Example of a home route
      },
    );
  }
}



