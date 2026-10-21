import 'package:flutter/material.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.0,
      height: 108.0,
      padding: EdgeInsetsGeometry.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: BoxBorder.all(color: Colors.black12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Reminder", style: TextStyle(color: Colors.black),),
                  // Text("Or more", style: TextStyle(color: Colors.black54),),
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
                  child: Icon(Icons.edit, size: 26.0, color: Colors.black,)
              ),
            ],
          ),
          Container(
            height: 32.0,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Text("Some text and icons")
              ],
            ),
          ),
        ],
      ),
    );;
  }
}
