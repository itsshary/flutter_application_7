import 'dart:async';

import 'package:flutter/material.dart';

import 'loginScreen.dart';

class SplashService {
  void islogin(context) {
    Timer(
        const Duration(seconds: 0),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            )));
  }
}
