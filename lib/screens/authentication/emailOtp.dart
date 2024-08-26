import 'package:flutter/material.dart';
import '../../utils/size_config.dart';

class EmailOtp extends StatelessWidget {
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
                SizedBox(height: SizeConfig.heightMultiplier * 8), // Updated size
                _image(),
                SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
                _header(),
                SizedBox(height: SizeConfig.heightMultiplier * 6), // Updated size
                _inputFields(context),
                SizedBox(height: SizeConfig.heightMultiplier * 4), // Updated size
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
            fontSize: SizeConfig.textMultiplier * 4, // Updated text size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2, // Updated text size
              color: Colors.black,
            ),
            children: [
              TextSpan(text: "Please enter the 6-digit OTP code sent to your "),
              TextSpan(
                text: "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/img/logo.png',
      height: SizeConfig.imageSizeMultiplier * 40, // Updated image size
    );
  }

  Widget _inputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Email OTP Code",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            filled: true,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the OTP code';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 4), // Updated size
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 20, // Updated padding
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/fPwd_phoneOtp');
            },
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2, // Updated text size
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3572EF),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 4, // Updated padding
                vertical: SizeConfig.heightMultiplier * 1.8, // Updated padding
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
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
          style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8), // Updated text size
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Resend OTP",
            style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8), // Updated text size
          ),
        ),
      ],
    );
  }
}
