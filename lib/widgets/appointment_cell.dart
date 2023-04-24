import 'package:flutter/material.dart';

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
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(4)),
                child: const Center(
                    child: Text(
                  '9.00am - 10.00am',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11),
                ))),
          )
        ],
      ),
    );
  }
}
