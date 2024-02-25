import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback callback;
  const Buttons(
      {super.key,
      required this.title,
      required this.callback,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 60,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3.0,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
