import 'package:flutter/material.dart';
import 'package:ordizy/services/auth.dart';
import '../../utils/size_config.dart'; // Import SizeConfig

class Register extends StatefulWidget {
  final Function toggle; // Function passed to toggle between Sign Up and Login pages

  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();

  String error = "";

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6), // Responsive padding
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _image('assets/img/logo.png'), // Add logo similar to SignInPage
                  SizedBox(height: SizeConfig.heightMultiplier * 1), // Reduced size
                  _signUpHeader(),
                  SizedBox(height: SizeConfig.heightMultiplier * 2), // Reduced size
                  _signUpInputFields(context),
                  SizedBox(height: SizeConfig.heightMultiplier * 4), // Further reduced size
                  _signUpButton(context),
                  SizedBox(height: SizeConfig.heightMultiplier * 1), // Reduced size
                  if (error.isNotEmpty)
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1), // Adjusted size
                  _loginLink(context), // Add the login link similar to SignInPage
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _image(String path) {
    return Image.asset(
      path,
      height: SizeConfig.imageSizeMultiplier * 20, // Updated image size
    );
  }

  Widget _signUpHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Create an Account",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 4, // Updated text size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 1), // Updated size
        Center(
          child: Text(
            "Enter your correct details to Join with Ordizy today!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2, // Updated text size
            ),
          ),
        ),
      ],
    );
  }

  Widget _signUpInputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 3),
        _textField(
          controller: _nameController,
          hintText: "Name",
          icon: Icons.person,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        _textField(
          controller: _emailController,
          hintText: "Email",
          icon: Icons.email,
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
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        _textField(
          controller: _phoneController,
          hintText: "Phone Number",
          icon: Icons.phone,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        _textField(
          controller: _passwordController,
          hintText: "Password",
          icon: Icons.lock,
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
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        _textField(
          controller: _confirmPasswordController,
          hintText: "Confirm Password",
          icon: Icons.lock,
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
      ],
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        filled: true,
        prefixIcon: Icon(icon),
      ),
      validator: validator,
    );
  }

  Widget _signUpButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 20, // Updated padding
      ),
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            dynamic result = await _auth.registerWithEmailPassword(
              _emailController.text,
              _passwordController.text,
              _nameController.text,
              _phoneController.text,
            );

            if (result != null) {
              // Show a SnackBar for success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Registration successful!"),
                  duration: Duration(seconds: 3), // Duration of the SnackBar
                ),
              );

              // Navigate to the home page after SnackBar is dismissed
              Future.delayed(Duration(seconds: 3), () {
                Navigator.of(context).pushReplacementNamed('/home'); // Change '/home' to your home route
              });
            }

          }
        },
        child: Text(
          "Sign Up",
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

  Widget _loginLink(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 1, // Adjusted padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8), // Updated text size
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 1), // Adjusted width
          GestureDetector(
            onTap: () {
              widget.toggle();
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 1.8, // Updated text size
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
