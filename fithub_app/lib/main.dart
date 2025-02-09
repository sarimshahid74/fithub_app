import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart' as login; // Alias for login_page import
import 'screens/signup_page.dart' as signup; // Alias for signup_page import
import 'package:fithub_app/home_page/front_page.dart'; // Correct import path

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const login.LoginPage(),
        '/signup': (context) => const signup.SignupPage(),
        newMethod: (context) => FrontPage(), // Route for FrontPage
      },
    );
  }

  String get newMethod => '/home';
}
