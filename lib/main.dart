import 'package:flutter/material.dart';
import 'package:saloon_app/Employee/E_Registration.dart';
import 'package:saloon_app/Login%20Pages/LoginPage.dart';
import 'package:saloon_app/Login%20Pages/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
    );
  }
}
