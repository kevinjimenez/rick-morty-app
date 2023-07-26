import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        child: ZoomIn(
            child: Image.asset(
          'assets/logo.jpeg',
        )));
  }
}
