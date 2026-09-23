import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  DayCard({super.key,required this.date});
  final DateTime date;

  String weekdayTranslator(int input) {
    switch (input) {
    case 1 : return "MON";
    case 2 : return "TUE";
    case 3 : return "WED";
    case 4 : return "THU";
    case 5 : return "FRI";
    case 6 : return "SAT";
    case 7 : return "SUN";
    default: return "ERR";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          width: 48.0,
          height: 64.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: BoxBorder.all(color: Colors.black12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(date.day.toString()),
              Text(weekdayTranslator(date.weekday)),
            ],
          ),
        ),
      ),
    );
  }
}

class DayList extends StatelessWidget {
  DayList({super.key});

  final today = DateTime.now();

  late final days = List.generate(
    31,
        (index) => today.add(
      Duration(days: index - 7),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return DayCard(
            date: days[index],
          );
        },
      ),
    );
  }
}
