import 'package:flutter/material.dart';
import 'package:ordizy/screens/authentication/register.dart';
import 'package:ordizy/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signinPage=true;


  //toggle pages
  void switchPages(){
    setState(() {
      signinPage =  !signinPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (signinPage ==true){
      return SignInPage(toggle: switchPages);
    }else{
      return Register(toggle: switchPages);
    }
  }
}
