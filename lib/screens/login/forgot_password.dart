import 'package:flutter/material.dart';
import '../../utils/size_config.dart'; // Import SizeConfig

class ForgotPassword extends StatelessWidget {
  // Define a default border radius if not provided by SizeConfig
  static const double borderRadius = 18.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6), // Updated margin
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 4), // Updated spacing
                _header(),
                SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated spacing
                _image(),
                SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated spacing
                _inputFields(context),
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
          "Forgot password",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 4.5, // Updated text size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated spacing
        Text(
          "Enter the email address to request a password reset",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5, // Updated text size
          ),
        ),
      ],
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/images/password.png', // Updated path to use 'assets/'
      height: SizeConfig.imageSizeMultiplier * 50, // Updated image height
    );
  }

  Widget _inputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter your email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius), // Use default border radius
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 6), // Updated spacing
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 20, // Updated padding
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/email_otp');
            },
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2.5, // Updated text size
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3572EF), // Background color
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 10, // Updated padding
                vertical: SizeConfig.heightMultiplier * 2.5, // Updated padding
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius), // Use default border radius
              ),
            ),
          ),
        ),
      ],
    );
  }
}
