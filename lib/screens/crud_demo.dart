import 'package:flutter/material.dart';
import 'package:google_auth/controller/firebase_api.dart';

class SimplECrudDemo extends StatefulWidget {
  const SimplECrudDemo({super.key});

  @override
  State<SimplECrudDemo> createState() => _SimplECrudDemoState();
}

class _SimplECrudDemoState extends State<SimplECrudDemo> {
  late Future<List<Map>> futureUserData;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    futureUserData = FirebaseApi.selectData();
    super.initState();
  }

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
                onPressed: (FirebaseApi.isUpdate)
                    ? () async {
                        await FirebaseApi.updateData(
                          key: FirebaseApi.selectedKey,
                          userName: _textEditingController.text,
                        );

                        futureUserData = FirebaseApi.selectData();

                        FirebaseApi.isUpdate = false;
                        _textEditingController.clear();
                        setState(() {});
                      }
                    : () async {
                        await FirebaseApi.setUserData(
                          userrName: _textEditingController.text,
                        );
                        futureUserData = FirebaseApi.selectData();
                        _textEditingController.clear();
                        setState(() {});
                      },
                child: (FirebaseApi.isUpdate)
                    ? const Text("Update")
                    : const Text("Submit"),
              ),
              FutureBuilder(
                future: futureUserData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) async {
                            await FirebaseApi.deleteData(
                                key: snapshot.data![index]['key']);
                            futureUserData = FirebaseApi.selectData();
                            setState(() {});
                          },
                          child: ListTile(
                            title: Text(snapshot.data![index]['userName']),
                            onTap: () {
                              FirebaseApi.selectedKey =
                                  snapshot.data![index]['key'];
                              _textEditingController.text =
                                  snapshot.data![index]['userName'];
                              FirebaseApi.isUpdate = true;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text("There is No Data");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
