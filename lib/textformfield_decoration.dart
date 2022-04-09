import 'package:flutter/material.dart';

InputDecoration textFormDecoration() {
  return InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)));
}
