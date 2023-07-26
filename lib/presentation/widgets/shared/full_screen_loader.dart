import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
        color: colors.primary,
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ));
  }
}
