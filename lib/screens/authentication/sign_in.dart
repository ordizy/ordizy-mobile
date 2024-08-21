import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //ref for the authServices class
  final AuthServices _auth=AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SIGN IN"),
      ),
      body: ElevatedButton(child: Text("Sign in Anoynymus"),
      onPressed: () async{
        dynamic result=await _auth.signInAnonymously();

        if(result==null){
          print("error in sign in anonymusly");
        }else{
          print("signed in annonymusly");
          print(result.uid);
        }
      },
      ),
    );
  }
}
