import 'package:flutter/material.dart';
import '../../utils/size_config.dart';
import '../../services/auth.dart'; // Import your auth service

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController(); // Add a TextEditingController
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String? _emailError; // Variable to store error message

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove back arrow
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6), // Updated margin
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
                _image('assests/img/logo.png'),
                // SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
                _forgotPasswordHeader(),
                SizedBox(height: SizeConfig.heightMultiplier * 4), // Updated size
                _forgotPasswordInputFields(context),
                SizedBox(height: SizeConfig.heightMultiplier * 4), // Updated size
                _forgotPasswordButton(context),
              ],
            ),
          ),
        ),
      ),
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

  Widget _forgotPasswordInputFields(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController, // Connect controller to the email input
            decoration: InputDecoration(
              hintText: "Enter your email",
              errorText: _emailError, // Show error message below the input
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
              final emailRegEx = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegEx.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _emailError = null; // Reset error message when typing
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _forgotPasswordButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 20, // Updated padding
      ),
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            // Form validation passed
            String email = _emailController.text.trim(); // Get the email from the controller

            try {
              await AuthServices().forgotPassword(email); // Call the forgotPassword method from Auth
              // Show success message
              _showDialog(context, 'Success', 'Password reset email sent! Please check your inbox.', success: true);
            } catch (e) {
              // Show error if there's an exception
              _showDialog(context, 'Error', 'Failed to send password reset email');
            }
          } else {
            setState(() {
              _emailError = _formKey.currentState?.validate() as String?; // Set error message if validation fails
            });
          }
        },
        child: Text(
          "Reset Password",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2, // Updated text size
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3572EF),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 8, // Updated padding
            vertical: SizeConfig.heightMultiplier * 1.5, // Updated padding
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String message, {bool success = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (success) {
                  Navigator.pushNamed(context, '/login');
                }
              },
            ),
          ],
        );
      },
    );
  }
}
