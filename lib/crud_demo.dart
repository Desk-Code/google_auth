import 'package:flutter/material.dart';
import 'package:google_auth/firebase_api.dart';

class SimplECrudDemo extends StatefulWidget {
  const SimplECrudDemo({super.key});

  @override
  State<SimplECrudDemo> createState() => _SimplECrudDemoState();
}

class _SimplECrudDemoState extends State<SimplECrudDemo> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: "Enter Text here.....",
                  labelText: "Text",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseApi.setUserData(
                    userrName: _textEditingController.text,
                  );
                  setState(() {});
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
