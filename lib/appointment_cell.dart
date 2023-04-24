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
      width: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          verticalDirection: VerticalDirection.down,
          children: [
            ...List.generate(
              10,
              (index) => Container(
                  height: 25,
                  width: 150,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(4)),
                  child: const Center(
                      child: Text(
                    '9.00am - 10.00am',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
