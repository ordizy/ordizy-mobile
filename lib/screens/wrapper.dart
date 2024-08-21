import 'package:flutter/material.dart';
import 'package:ordizy/screens/authentication/authenticate.dart';
import 'package:ordizy/screens/home.dart';
import 'package:provider/provider.dart';

import '../models/UserModel.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user=Provider.of<UserModel?>(context);

    if(user==null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
