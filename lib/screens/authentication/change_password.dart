import 'package:flutter/material.dart';
import '../../utils/size_config.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6), // Responsive margin
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 6), // Responsive height
                _image(),
                SizedBox(height: SizeConfig.heightMultiplier * 2), // Responsive height
                _header(),
                SizedBox(height: SizeConfig.heightMultiplier * 6), // Responsive height
                _inputFields(context),
                SizedBox(height: SizeConfig.heightMultiplier * 4), // Responsive height
              ],
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
          "Reset Password",
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 4, // Responsive font size
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2), // Responsive height
        Text(
          "Your new password must be different from the previous one.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2 // Responsive font size
          ),
        ),
      ],
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/img/logo.png',
      height: SizeConfig.imageSizeMultiplier * 40, // Responsive image height
    );
  }

  Widget _inputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "New password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18), // Responsive border radius
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your new password';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 4), // Responsive height
        TextFormField(
          decoration: InputDecoration(
            hintText: "Confirm password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18), // Responsive border radius
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 4), // Responsive height
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 20), // Responsive padding
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/updated');
            },
            child: Text(
              "Next",
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2, // Responsive font size
                  color: Colors.white
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3572EF),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 4, // Responsive padding
                  vertical: SizeConfig.blockSizeVertical * 1.5 // Responsive padding
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18), // Responsive border radius
              ),
            ),
          ),
        ),
      ],
    );
  }
}
