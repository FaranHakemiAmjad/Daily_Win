import 'dart:ui';

import 'package:daily_win/app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HabitCreationPopup extends StatelessWidget {
  const HabitCreationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: SizedBox(
        height: 144.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                context.push(AppRoutes.addHabit);
              },
              splashColor: Colors.black12,
              child: Container(
                height: 68.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Colors.white),
                child: Center(child: Text("Create Habit")),
              ),
            ),
            InkWell(
              child: Container(
                height: 68.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}