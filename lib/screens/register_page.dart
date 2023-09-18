import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/controller/main_page.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final TextEditingController _txtEmailController = TextEditingController();
  final TextEditingController _txtPassController = TextEditingController();
  final TextEditingController _txtConfPassController = TextEditingController();

  @override
  void dispose() {
    _txtEmailController.dispose();
    _txtPassController.dispose();
    _txtConfPassController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
            padding: const EdgeInsets.all(20.0),
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
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _txtConfPassController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_txtPassController.text.trim() ==
                        _txtConfPassController.text.trim()) {
                      signUp();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Please,reType your Confirm Password")));
                    }
                  },
                  child: const Text("Sign UP"),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(" You Have not an Account "),
                    TextButton(
                        onPressed: widget.showLoginPage,
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
