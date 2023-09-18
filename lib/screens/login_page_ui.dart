import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageUi extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPageUi({super.key, required this.showRegisterPage});

  @override
  State<LoginPageUi> createState() => _LoginPageUiState();
}

class _LoginPageUiState extends State<LoginPageUi> {
  final TextEditingController _txtEmailController = TextEditingController();
  final TextEditingController _txtPassController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges();
    super.initState();
  }

  @override
  void dispose() {
    _txtEmailController.dispose();
    _txtPassController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _txtEmailController.text.trim(),
        password: _txtPassController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _txtEmailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _txtPassController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forget Password",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      signIn();
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setBool('showHome', false);
                    },
                    child: const Text("Sign In")),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(" You Have not an Account "),
                    TextButton(
                        onPressed: widget.showRegisterPage,
                        child: const Text("Click Here!"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
