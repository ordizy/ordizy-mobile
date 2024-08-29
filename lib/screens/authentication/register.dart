import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/size_config.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

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
  bool _isBuyer = true; // Default role is buyer

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

    return SafeArea(
      child: Scaffold(
        body: Center( // Center the content vertically
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6), // Updated margin
              child: Column(
                mainAxisSize: MainAxisSize.min, // Use minimum size for vertical centering
                children: [
                  SizedBox(height: SizeConfig.heightMultiplier * 3), // Updated size
                  _image('assests/img/logo.png'),
                  // SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
                  _signUpHeader(),
                  // SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size

                  // Reduce the height of this SizedBox to minimize the gap
                  _roleSelection(),
                  SizedBox(height: SizeConfig.heightMultiplier * 1), // Reduced size

                  Form(
                    key: _formKey,
                    child: _signUpInputFields(context),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 3), // Reduced size
                  _signUpButton(context),
                  SizedBox(height: SizeConfig.heightMultiplier * 2), // Reduced size
                  if (error.isNotEmpty)
                    Center(
                      child: Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: SizeConfig.textMultiplier * 2),
                        textAlign: TextAlign.center,
                      ),
                    ),
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

  Widget _roleSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: true,
          groupValue: _isBuyer,
          onChanged: (value) {
            setState(() {
              _isBuyer = value!;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*4), // Reduce the padding
          child: Text("Buyer"),
        ),
        Radio(
          value: false,
          groupValue: _isBuyer,
          onChanged: (value) {
            setState(() {
              _isBuyer = value!;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*4), // Reduce the padding
          child: Text("Seller"),
        ),
      ],
    );
  }

  Widget _signUpInputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2), // Adjusted size
        _textField(
          controller: _nameController,
          hintText: _isBuyer ? 'Name' : 'Shop Name',
          icon: Icons.person,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${_isBuyer ? 'name' : 'shop name'}';
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
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
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
              email: _emailController.text,
              password: _passwordController.text,
              name: _nameController.text,
              phoneNumber: _phoneController.text,
              isBuyer: _isBuyer,
            );

            if (result == null) {
              // Show a SnackBar for success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Registration successful!"),
                  duration: Duration(seconds: 3), // Duration of the SnackBar
                ),
              );

              // Navigate to the login page after SnackBar is dismissed
              Future.delayed(Duration(seconds: 3), () {
                Navigator.of(context).pushReplacementNamed('/login');
              });
            } else {
              // Show an error message
              setState(() {
                error = result; // Display the error message
              });
            }
          }
        },
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2, // Updated text size
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3572EF),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 10,
            vertical: SizeConfig.heightMultiplier * 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }

  Widget _loginLink(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.textMultiplier * 2,
            ),
          ),
          TextSpan(
            text: 'Login',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushNamed('/login');
              },
          ),
        ],
      ),
    );
  }
}
