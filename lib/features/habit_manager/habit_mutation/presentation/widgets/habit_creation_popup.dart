import 'dart:ui';

import 'package:flutter/material.dart';

class HabitCreationPopup extends StatelessWidget {
  const HabitCreationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
      child: Container(
        height: 144.0,
        color: Colors.blue,
      ),
    );
  }
}