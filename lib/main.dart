import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/login_screen.dart' as login;
import 'screens/signupscreen.dart' as signup;
import 'admin/adminDashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => login.LoginScreen(),
        '/signup': (context) => signup.SignupScreen(),
        '/admin': (context) => AdminDashboard(),
      },
    );
  }
}
