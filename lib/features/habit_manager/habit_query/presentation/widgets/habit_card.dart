import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter/widgets.dart';

@Preview(name: 'Habit Card')
Widget card() {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
    child: Container(
      width: 345.0,
      height: 68.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: BoxBorder.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: Checkbox.width,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.black12,
                  color: Color.fromARGB(255, 21, 40, 255),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Habit Title", style: TextStyle(color: Colors.black),),
                    Text("Habit Progress", style: TextStyle(color: Colors.black54),),
                  ],
                )
              ],
            ),
            Container(
              width: 36.0,
              height: 36.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15.0),
                border: BoxBorder.all(color: Colors.black),
              ),
                child: Icon(Icons.add, size: 26.0, color: Colors.black,)
            ),
          ],
        ),
      ),
    ),
  );
}
