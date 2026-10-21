import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164.5,
      height: 68.0,
      child: InkWell(
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {},
        child: Container(
          padding: EdgeInsetsGeometry.all(10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
            border: BoxBorder.all(color: Colors.black12),
            color: Colors.white
          ),
          child: Row(
            spacing: 12.0,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Orange", style: TextStyle(color: Colors.black),),
                  Text("Color", style: TextStyle(color: Colors.black54),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
