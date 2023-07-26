import 'package:flutter/material.dart';

class ChangeStatus {
  static Color color(String status) {
    //! usar enum
    switch (status) {
      case 'Alive':
        return Colors.green;

      case 'Dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}