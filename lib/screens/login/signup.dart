import 'package:flutter/material.dart';
import '../../utils/size_config.dart'; // Import SizeConfig

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.5)),
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4), // Responsive padding
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2), // Responsive font size
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2), // Responsive spacing
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2), // Responsive font size
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2), // Responsive spacing
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2), // Responsive font size
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 3), // Responsive spacing
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process sign up here, e.g., make an API call
                    Navigator.pushReplacementNamed(context, '/dashboard'); // Redirect to the dashboard after sign up
                  }
                },
                child: Text('Sign Up', style: TextStyle(fontSize: SizeConfig.textMultiplier * 2)), // Responsive text size
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 10, // Responsive padding
                    vertical: SizeConfig.heightMultiplier * 2, // Responsive padding
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18), // Use consistent border radius
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2), // Responsive spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?", style: TextStyle(fontSize: SizeConfig.textMultiplier * 2)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login'); // Redirect to the login page
                    },
                    child: Text('Login', style: TextStyle(fontSize: SizeConfig.textMultiplier * 2, color: Colors.blue)), // Responsive text size
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
