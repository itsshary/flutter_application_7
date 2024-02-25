import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/postscreen.dart';
import 'package:flutter_application_7/utils.dart';

import 'componets.dart';

class Verifiyscreen extends StatefulWidget {
  final String verificationid;
  const Verifiyscreen({super.key, required this.verificationid});

  @override
  State<Verifiyscreen> createState() => _VerifiyscreenState();
}

class _VerifiyscreenState extends State<Verifiyscreen> {
  final Otpphonenocontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP SCREEN'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          TextFormField(
            controller: Otpphonenocontroller,
            decoration: InputDecoration(
              hintText: 'Enter OTP',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Buttons(
              title: 'Verifiy',
              loading: loading,
              callback: () async {
                setState(() {
                  loading = true;
                });
                final Credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationid,
                    smsCode: Otpphonenocontroller.text.toString());
                try {
                  await auth.signInWithCredential(Credential);
                  Utilies().fluttertoast('Login Successfully');
                  setState(() {
                    loading = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Postscreen(),
                      ));
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  Utilies().fluttertoast(e.toString());
                }
              }),
        ],
      ),
    );
  }
}
