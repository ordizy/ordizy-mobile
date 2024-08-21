
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login/login.dart';
import 'screens/login/signup.dart';
import 'screens/login/forgot_password.dart';
import 'screens/users/dashboard.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {

        '/': (context) => StartPage(),

        // ## Login ##

        '/login': (context) => LoginAndForgotPassword(),
        '/signup': (context) => SignUpPage(),
        '/forgot_password': (context) => ForgotPassword(),



        // ### Users ###

        '/dashboard': (context) => UserDashboard(),


      },
    );
  }
}
