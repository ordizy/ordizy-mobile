import 'package:flutter/material.dart';
import '../../utils/size_config.dart';

class LoginAndForgotPassword extends StatefulWidget {
  @override
  _LoginAndForgotPasswordState createState() => _LoginAndForgotPasswordState();
}

class _LoginAndForgotPasswordState extends State<LoginAndForgotPassword> {
  bool _showForgotPassword = false;

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
                SizedBox(height: SizeConfig.heightMultiplier * 3), // Updated size

                // Display the logo image first, then the header
                _image(_showForgotPassword ? 'assets/img/password.png' : 'assets/img/logo.png'),
                SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
                _showForgotPassword ? _forgotPasswordHeader() : _loginHeader(),
                SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
                _showForgotPassword ? _forgotPasswordInputFields(context) : _loginInputFields(context),
                SizedBox(height: SizeConfig.heightMultiplier * 4), // Updated size
                _showForgotPassword ? _forgotPasswordButton(context) : _loginButton(context),
                _showForgotPassword ? SizedBox() : _signUpLink(context), // Add the signup link only for login
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Welcome to Ordizy",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 4, // Updated text size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 1), // Updated size
        Text(
          "No more waiting..",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2, // Updated text size
          ),
        ),
      ],
    );
  }

  Widget _forgotPasswordHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Forgot password",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 4, // Updated text size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
        Text(
          "Enter the email address to request a password reset",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2, // Updated text size
          ),
        ),
      ],
    );
  }

  Widget _image(String path) {
    return Image.asset(
      path,
      height: SizeConfig.imageSizeMultiplier * 40, // Updated image size
    );
  }

  Widget _loginInputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 5),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 5), // Updated size
        TextFormField(
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
        _forgotPasswordLink(context), // Moved here
      ],
    );
  }

  Widget _forgotPasswordInputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter your email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
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
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 20, // Updated padding
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            '/dashboard',
          );
        },
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2, // Updated text size
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3572EF),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 12, // Updated padding
            vertical: SizeConfig.heightMultiplier * 1.5, // Updated padding
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordButton(BuildContext context) {
    return Padding(
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
            fontSize: SizeConfig.textMultiplier * 2, // Updated text size
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3572EF),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 5, // Updated padding
            vertical: SizeConfig.heightMultiplier * 1.5, // Updated padding
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordLink(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/forgot_password'); // Redirect to Forgot Password page
      },
      child: Text("Forgot password?"),
    );
  }

  Widget _signUpLink(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 2, // Adjust padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8), // Updated text size
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signup'); // Redirect to Sign-up page
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 1.8, // Updated text size
                color: Color(0xFF3572EF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
