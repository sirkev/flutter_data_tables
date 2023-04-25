import 'package:flutter/material.dart';

class AppointmentCellV2 extends StatelessWidget {
  const AppointmentCellV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        height: 50,
        child: GridView.builder(
            itemCount: 2,
            //  scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 25,
                child: Container(
                    height: 25,
                    width: 150,
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Center(
                        child: Text(
                      '9.00am - 10.00am',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ))),
              );
            }));
  }
}
