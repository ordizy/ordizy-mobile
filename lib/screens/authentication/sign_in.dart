import 'package:flutter/material.dart';
import '../../utils/size_config.dart';
import '../../services/auth.dart';
 // Import the signup page

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers for managing input fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String error = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  _image('assets/img/logo.png'),
                  SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
                  _loginHeader(),
                  SizedBox(height: SizeConfig.heightMultiplier * 2), // Updated size
                  Form(
                    key: _formKey,
                    child: _loginInputFields(context),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1), // Reduced size
                  _loginButton(context),
                  _signUpLink(context), // Add the signup link only for login
                ],
              ),
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
        Center(
          child: Text(
            "Login to continue your seamless shopping experience",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2, // Updated text size
            ),
          ),
        ),
      ],
    );
  }

  Widget _image(String path) {
    return Image.asset(
      path,
      height: SizeConfig.imageSizeMultiplier * 20, // Updated image size
    );
  }

  Widget _loginInputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 5),
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
          controller: _passwordController,
          hintText: "Password",
          icon: Icons.lock,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 1), // Reduced size
        Visibility(
          visible: error.isNotEmpty,
          child: Center(
            child: Text(
              error,
              style: TextStyle(color: Colors.red,
                  fontSize: SizeConfig.textMultiplier * 2
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _forgotPasswordLink(context), // Moved here
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

  Widget _loginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 20, // Updated padding
      ),
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            dynamic result = await _auth.signInUsingEmailAndPassword(
              _emailController.text,
              _passwordController.text,
            );

            if (result == null) {
              setState(() {
                error = "Please enter valid credentials";
              });
            } else {
              Navigator.pushReplacementNamed(context, '/buyer_home');
            }
          }
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

  Widget _forgotPasswordLink(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/forgot_password');
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
          SizedBox(width: SizeConfig.blockSizeHorizontal * 1), // Updated width
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              "Sign Up",
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
