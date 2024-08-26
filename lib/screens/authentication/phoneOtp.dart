import 'package:flutter/material.dart';
import '../../utils/size_config.dart'; // Ensure SizeConfig is imported

class ForgotpwdPhoneotp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6), // Use SizeConfig for margin
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 8), // Use SizeConfig for height
                _image(), // Image added here
                SizedBox(height: SizeConfig.heightMultiplier * 2), // Spacing between image and header
                _header(),
                SizedBox(height: SizeConfig.heightMultiplier * 6), // Spacing after header
                _inputFields(context),
                SizedBox(height: SizeConfig.heightMultiplier * 4), // Spacing after input fields
                _resend(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/img/logo.png', // Ensure the path to your image is correct
      height: SizeConfig.imageSizeMultiplier * 40, // Use SizeConfig for image height
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Verification",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 4, // Use SizeConfig for font size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2), // Spacing after header text
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2, // Use SizeConfig for font size
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: "Please enter the 6-digit OTP code sent to your ",
              ),
              TextSpan(
                text: "Phone number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: "."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _inputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Phone number OTP Code",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18), // Use SizeConfig for border radius
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            filled: true,
            // prefixIcon: Icon(Icons.person), // Uncomment if needed
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the OTP code';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 4), // Use SizeConfig for height
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 20, // Use SizeConfig for horizontal padding
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/reset_password');
            },
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2, // Use SizeConfig for font size
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3572EF),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 4, // Use SizeConfig for horizontal padding
                vertical: SizeConfig.heightMultiplier *1.5, // Use SizeConfig for vertical padding
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18), // Use SizeConfig for border radius
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _resend(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't receive the verification OTP?",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 1.8, // Use SizeConfig for font size
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Resend OTP",
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.8, // Use SizeConfig for font size
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
