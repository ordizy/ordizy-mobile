import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

class ForgotpwdPhoneotp extends StatelessWidget {
  // TextEditingController to capture OTP input
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 6), // Adjusted margin
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: SizeConfig.blockSizeVertical! * 3), // Adjusted spacing
                _header(),
                SizedBox(height: SizeConfig.blockSizeVertical! * 2), // Adjusted spacing
                // _image(), // Add the image widget here if needed
                // SizedBox(height: SizeConfig.blockSizeVertical! * 2), // Adjusted spacing
                _inputFields(context),
                SizedBox(height: SizeConfig.blockSizeVertical! * 2), // Adjusted spacing
                _resend(context),
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
          "Verification",
          style: TextStyle(
            fontSize: SizeConfig.blockSizeHorizontal! * 10, // Adjusted font size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical! * 1), // Adjusted spacing
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 5, // Adjusted font size
              color: Colors.black,
            ),
            children: [
              TextSpan(
                  text: "Please enter the 6-digit OTP code sent to your "),
              TextSpan(
                text: "Phone number",
                style: TextStyle(fontWeight: FontWeight.bold),
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
          controller: otpController, // Assign the TextEditingController
          decoration: InputDecoration(
            hintText: "Phone number OTP Code",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context)
                .colorScheme
                .secondary
                .withOpacity(0.1),
            filled: true,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the OTP code';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.blockSizeVertical! * 5), // Adjusted spacing
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 20), // Adjusted padding
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/reset_password');
            },
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 5, // Adjusted font size
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3572EF),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 5,
                vertical: SizeConfig.blockSizeVertical! * 2, // Adjusted padding
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _resend(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Didn't receive the verification OTP?"),
        TextButton(
            onPressed: () {
              // Implement resend OTP functionality here
            },
            child: Text("Resend OTP")),
      ],
    );
  }
}

