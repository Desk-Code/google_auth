import 'package:flutter/material.dart';
import 'package:google_auth/screens/login_page_ui.dart';
import 'package:google_auth/screens/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  @override
  Widget build(BuildContext context) {
    void toggleScreens() {
      setState(() {
        showLoginPage = !showLoginPage;
      });
    }

    if (showLoginPage) {
      return LoginPageUi(
        showRegisterPage: toggleScreens,
      );
    } else {
      return RegisterPage(
        showLoginPage: toggleScreens,
      );
    }
  }
}
