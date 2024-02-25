import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/componets.dart';
import 'package:flutter_application_7/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final datbaseref = FirebaseDatabase.instance.ref('Post');
  final addscreencontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: addscreencontroller,
              maxLines: 4,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Buttons(
                title: 'Add',
                callback: () {
                  datbaseref
                      .child(DateTime.now().millisecondsSinceEpoch.toString())
                      .set({
                    'title': addscreencontroller.text.toString(),
                    'id': DateTime.now().millisecondsSinceEpoch.toString(),
                  }).then((value) {
                    Utilies().fluttertoast('Post Saved');
                  }).onError((error, stackTrace) {
                    Utilies().fluttertoast(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
