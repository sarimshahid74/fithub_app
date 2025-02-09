// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:fithub_app/services/authentication.dart';
import 'package:fithub_app/widgets/custom_button.dart';
import 'forgot_password.dart'; // Import the ForgotPasswordDialog widget
import '../home_page/front_page.dart'; // Correct import path

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(),
            _inputField(context, emailController, passwordController),
            _forgotPassword(context),
            _googleSignInButton(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        Text(
          "Enter your credentials to login",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _inputField(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color.fromARGB(25, 128, 0, 128),
            filled: true,
            prefixIcon: const Icon(Icons.email, color: Colors.orange),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color.fromARGB(25, 128, 0, 128),
            filled: true,
            prefixIcon: const Icon(Icons.lock, color: Colors.orange),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        CustomButton(
          text: "Login",
          onPressed: () async {
            String res = await AuthService().loginUser(
              email: emailController.text,
              password: passwordController.text,
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(res)));
              // Navigate to FrontPage after successful login
              if (res == "Login successful") {
                // Replace with your success message
                Navigator.pushNamed(context, newMethod);
              }
            }
          },
        ),
      ],
    );
  }

  String get newMethod => '/home';

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Show the ForgotPasswordDialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ForgotPasswordDialog();
          },
        );
      },
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.orange),
      ),
    );
  }

  Widget _googleSignInButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        String res = await AuthService().signInWithGoogle();
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(res)));
        }
      },
      child: const Text("Sign In with Google",
          style: TextStyle(color: Colors.orange)),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ],
    );
  }
}
