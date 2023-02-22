import 'package:flutter/material.dart';

Widget customCenter(String title, Color color) {
  return Center(
      child: Text(
    title,
    style: TextStyle(
      letterSpacing: 3,
      height: 2.5,
      fontWeight: FontWeight.bold,
      color: color,
      fontSize: 32,
    ),
   ),
  );
}
