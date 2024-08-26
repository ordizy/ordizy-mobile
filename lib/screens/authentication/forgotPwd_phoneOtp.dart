import 'package:flutter/material.dart';

class ForgotpwdPhoneotp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(  // Wrap the content with SingleChildScrollView
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 30),
                _header(),
                SizedBox(height: 20), // Adjust the spacing as needed
                // _image(), // Add the image widget here
                // SizedBox(height: 20), // Adjust the spacing as needed
                _inputFields(context),
                SizedBox(height: 5),
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
              fontSize: 40,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ), // Default text style
            children: [
              TextSpan(
                  text: "Please enter the 6-digit OTP code sent to your "
              ),
              TextSpan(
                text: "Phone number",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ), // Bold style for "email"
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
      'asset/images/otp.png', // Make sure to add your image to the assets folder and update the path
      height: 300, // Adjust the height as needed
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
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            filled: true,
            // prefixIcon: Icon(Icons.person),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/reset_password');
            },
            child: Text(
              "Next",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ), // Text color is white
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3572EF), // Background color
              padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15
              ), // Adjust padding as needed
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
        Text(
            "Didn't receive the verification OTP?"
        ),
        TextButton(onPressed: () {},
            child: Text(
                "Resend OTP"
            )
        )
      ],
    );
  }
}
