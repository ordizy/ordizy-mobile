import 'package:flutter/material.dart';
import '../../utils/size_config.dart';
import 'dart:async';

class PasswordChanged extends StatefulWidget {
  @override
  _PasswordChangedState createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<PasswordChanged> {
  @override
  void initState() {
    super.initState();

    // Redirect to the login page after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity, // Ensure the Column takes the full width
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  _image(),
                  SizedBox(height: SizeConfig.heightMultiplier * 8), // Responsive spacing
                  _header(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Password Updated",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 4, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2), // Responsive spacing
        Text(
          "Your password has been updated.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2, // Responsive font size
          ),
        ),
      ],
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/img/update.png',
      height: SizeConfig.imageSizeMultiplier * 70, // Responsive image height
    );
  }
}
