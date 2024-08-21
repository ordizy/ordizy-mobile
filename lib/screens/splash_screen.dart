import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class StartPage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to login screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);

    return Scaffold(
      body: Center(
        child: _image(),
      ),
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/img/logo.png',
      height: SizeConfig.blockSizeVertical * 60, // 60% of screen width for image height
      fit: BoxFit.contain,
    );
  }
}
