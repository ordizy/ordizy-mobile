import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ordizy/services/auth.dart';

class Home extends StatelessWidget {


  //create object from AuthService
  final AuthServices _auth=AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            ElevatedButton(
              onPressed: () async {
                try {
                  // Sign out the user
                  await FirebaseAuth.instance.signOut();

                  // Redirect to the home page
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                        (Route<dynamic> route) => false,
                  );
                } catch (e) {
                  print('Error during sign-out: ${e.toString()}');
                }
              },
              child: const Icon(Icons.logout),
            )
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome to the Home Screen!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your navigation or functionality here
                  print("Button 1 Pressed");
                },
                child: const Text("Go to Page 1"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add your navigation or functionality here
                  print("Button 2 Pressed");
                },
                child: const Text("Go to Page 2"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add your navigation or functionality here
                  print("Button 3 Pressed");
                },
                child: const Text("Go to Page 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
