import 'package:flutter/material.dart';
import 'package:saloon_app/Common/InputDecoration.dart'; // Assuming this file exists

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 1.5, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const Expanded(
          child: Divider(thickness: 1.5, color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background for the app
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white, // White background for the form
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back to the Saloon App",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email Input Field
                  TextFormField(
                    controller: _email,
                    decoration: commonInputDecoration('Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password Input Field
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: commonInputDecoration('Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Continue Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Add your logic here
                      }
                    },
                    // style: ElevatedButton.styleFrom(
                    //   padding: EdgeInsets.symmetric(vertical: 15.0),
                    //   // backgroundColor: Colors.blueAccent, // Custom color
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Sign-up Prompt
                  TextButton(
                    onPressed: () {
                      // Add your logic for signing up
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // OR Section
                  _buildSectionHeader("OR"),
                  const SizedBox(height: 15),

                  // Continue with Google
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your logic here
                    },
                    icon: Icon(Icons.g_mobiledata_rounded, size: 30),
                    label: Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 16),
                    ),
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.white,
                    //   foregroundColor: Colors.black,
                    //   padding: EdgeInsets.symmetric(vertical: 15.0),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     side: BorderSide(color: Colors.grey),
                    //   ),
                    // ),
                  ),
                  const SizedBox(height: 10),

                  // Continue with Apple
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your logic here
                    },
                    icon: Icon(Icons.apple, size: 30),
                    label: Text(
                      "Continue with Apple",
                      style: TextStyle(fontSize: 16),
                    ),
                    // style: ElevatedButton.styleFrom(
                    //   // backgroundColor: Colors.black,
                    //   padding: EdgeInsets.symmetric(vertical: 15.0),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // ),
                  ),
                  const SizedBox(height: 20),

                  // QR Scanner Section
                  _buildSectionHeader("Scanner"),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your logic here
                    },
                    icon: Icon(Icons.qr_code_scanner),
                    label: Text(
                      "QR Scanner",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
