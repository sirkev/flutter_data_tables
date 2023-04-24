import 'package:flutter/material.dart';

class StaffCell extends StatefulWidget {
  const StaffCell(
      {Key? key,
      required this.name,
      required this.id,
      required this.imageUrl,
      required this.hours,
      required this.isAvailable})
      : super(key: key);
  final String name;
  final String id;
  final String imageUrl;
  final bool isAvailable;
  final String hours;

  @override
  State<StaffCell> createState() => _StaffCellState();
}

class _StaffCellState extends State<StaffCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(widget.imageUrl),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name),
              Text(widget.hours),
            ],
          )
        ],
      ),
    );
  }
}
