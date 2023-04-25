import 'package:flutter/material.dart';

class StaffCell extends StatefulWidget {
  const StaffCell(
      {Key? key,
      required this.name,
      required this.id,
      required this.imageUrl,
      required this.hours,
      required this.isWorking})
      : super(key: key);
  final String name;
  final String id;
  final String imageUrl;
  final bool isWorking;
  final String hours;

  @override
  State<StaffCell> createState() => _StaffCellState();
}

class _StaffCellState extends State<StaffCell> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widget.isWorking
                ? Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xff26d07c),
                        shape: BoxShape.circle,
                      ),
                    ))
                : const SizedBox(),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name),
            widget.isWorking
                ? Text(
                    widget.hours,
                    style: const TextStyle(color: Colors.black54, fontSize: 11),
                  )
                : const Text(
                    'Not working',
                    style: TextStyle(color: Colors.black54, fontSize: 11),
                  ),
          ],
        )
      ],
    );
  }
}
