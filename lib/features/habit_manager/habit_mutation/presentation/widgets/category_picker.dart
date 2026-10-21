import 'package:flutter/material.dart';

class CategoryPicker extends StatefulWidget {
  const CategoryPicker({super.key});

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
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
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category", style: TextStyle(color: Colors.black),),
                  Text("Cardio", style: TextStyle(color: Colors.black54),),
                ],
              )
            ],
          ),
        ),
      ),
    );;
  }
}
