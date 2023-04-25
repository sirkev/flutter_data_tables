import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_data_tables/data/data.dart';

class AppointmentCell extends StatefulWidget {
  const AppointmentCell({Key? key}) : super(key: key);

  @override
  State<AppointmentCell> createState() => _AppointmentCellState();
}

class _AppointmentCellState extends State<AppointmentCell> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      //height: 100,
      child: Wrap(
        children: [
          ...List.generate(
            10,
            (index) => Container(
                height: 20,
                width: 100,
                margin: const EdgeInsets.only(bottom: 4, top: 2),
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
                ))),
          )
        ],
      ),
    );
  }
}
