import 'package:flutter/material.dart';

Widget homeTopPlaceHolder() {
  return Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        border: BoxBorder.all(color: Colors.black),
      ),
      child: Icon(Icons.question_mark_outlined, size: 26.0, color: Colors.black,)
  );
}