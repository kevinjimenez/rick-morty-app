import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ));
  }
}
