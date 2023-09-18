import 'package:flutter/material.dart';

class CommonSignUpButton extends StatelessWidget {
  const CommonSignUpButton({super.key, required this.name, required this.call});

  final String name;
  final VoidCallback call;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: call,
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.purple,
          fontSize: 20,
        ),
      ),
    );
  }
}

class CommonSignInButton extends StatelessWidget {
  const CommonSignInButton({super.key, required this.name, required this.call});

  final String name;
  final VoidCallback call;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: call,
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.purple,
          fontSize: 20,
        ),
      ),
    );
  }
}
