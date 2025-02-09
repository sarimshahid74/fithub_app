import 'package:flutter/material.dart';
import 'package:fithub_app/services/authentication.dart';

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController resetEmailController = TextEditingController();
    return AlertDialog(
      title: const Text("Reset Password"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: resetEmailController,
            decoration: const InputDecoration(
              hintText: "Enter your email",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            String res = await AuthService().resetPassword(resetEmailController.text);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
            Navigator.pop(context); // Close the dialog
          },
          child: const Text("Send Reset Email"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog without action
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
