import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/componets.dart';
import 'package:flutter_application_7/utils.dart';
import 'package:flutter_application_7/verify_scree.dart';

class Loginwithphonenumber extends StatefulWidget {
  const Loginwithphonenumber({super.key});

  @override
  State<Loginwithphonenumber> createState() => _LoginwithphonenumberState();
}

class _LoginwithphonenumberState extends State<Loginwithphonenumber> {
  final loginphonenocontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          TextFormField(
            controller: loginphonenocontroller,
            decoration: InputDecoration(
              hintText: 'Enter Phone number',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Buttons(
              title: 'Verification',
              loading: loading,
              callback: () {
                setState(() {
                  loading = true;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: loginphonenocontroller.text.toString(),
                    verificationCompleted: (_) {
                      setState(() {
                        loading = false;
                      });
                    },
                    verificationFailed: (e) {
                      Utilies().fluttertoast(e.toString());
                      setState(() {
                        loading = false;
                      });
                    },
                    codeSent: (String verificationid, int? token) {
                      Utilies().fluttertoast('Check Verification OTP');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Verifiyscreen(verificationid: verificationid),
                          ));
                    },
                    codeAutoRetrievalTimeout: (e) {
                      setState(() {
                        loading = false;
                      });
                      Utilies().fluttertoast(e.toString());
                    });
              }),
        ],
      ),
    );
  }
}
