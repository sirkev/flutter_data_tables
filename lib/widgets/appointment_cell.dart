import 'dart:math';

import 'package:flutter/material.dart';

import '../data/data.dart';

class AppointmentCell extends StatefulWidget {
  final String workingHours;
  const AppointmentCell({Key? key, required this.workingHours})
      : super(key: key);

  @override
  State<AppointmentCell> createState() => _AppointmentCellState();
}

class _AppointmentCellState extends State<AppointmentCell> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 100,
        //height: 100,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.25, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
                height: 20,
                width: 200,
                margin: const EdgeInsets.only(bottom: 4, top: 2, right: 4),
                decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(2)),
                child: Center(
                    child: Text(
                  workingHours[Random().nextInt(workingHours.length)],
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 11),
                )));
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
