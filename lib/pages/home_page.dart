import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_data_tables/widgets/staff_cell.dart';

import '../data/data.dart';
import '../widgets/appointment_cell.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _verticalScrollController;
  late ScrollController _horizontalScrollController;
  late List<Map<String, dynamic>> _employees;
  late List<String> workingDays;
  @override
  void initState() {
    super.initState();
    _verticalScrollController = ScrollController();
    _horizontalScrollController = ScrollController();
    var result = getEmployees();
    _employees = result["employees"];
    getWorkingDays(_employees[0]["workingHours"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              'Employee',
              style: TextStyle(
                  color: Color(0xff1d252d),
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Working hours'),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
            height: 200,
            child: Scrollbar(
              controller: _verticalScrollController,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _verticalScrollController,
                child: Scrollbar(
                  controller: _horizontalScrollController,
                  child: Scrollbar(
                    controller: _verticalScrollController,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columnSpacing: 20,
                          horizontalMargin: 5,
                          border: TableBorder.all(
                              color: Colors.grey[400] as Color,
                              borderRadius: BorderRadius.circular(10)),
                          columns:
                              _getDayColumns(_employees[0]["workingHours"]),
                          rows: _getEmployeeRows()),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataCell> _getEmployeeNameCells() {
    List<DataCell> cells = [];
    for (String employeeName in staffNames) {
      cells.add(DataCell(Text(employeeName)));
    }
    return cells;
  }

  List<DataRow> _getEmployeeRows() {
    List<DataRow> rows = List.generate(
        _employees.length,
        (index) => DataRow(cells: [
              DataCell(StaffCell(
                name: _employees[index]["name"],
                id: '${_employees[index]}',
                imageUrl: '${_employees[index]["avatarUrl"]}',
                isWorking: Random().nextBool(),
                hours: '16 h',
              )),
              DataCell(AppointmentCell()),
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(Text('')),
            ]));

    return rows;
  }

  List<DataColumn> _getDayColumns(Map<String, dynamic> workingHours) {
    List<DataColumn> columns = [];
    columns.add(const DataColumn(
        label: Text('Change Staff',
            style: TextStyle(
                color: Colors.amberAccent, fontWeight: FontWeight.w700))));
    workingHours.forEach((key, value) {
      String reversedKey = reverseDateFormats(key);
      DateTime parsedKeys = parseDate(reversedKey);
      print(parsedKeys);
      columns.add(DataColumn(
          label: Center(
        child: Text(getWeekdayFromDate(parsedKeys),
            style: const TextStyle(
                color: Color(0xff1d252d), fontWeight: FontWeight.w700)),
      )));
    });

    print('${columns.length}');

    return columns;
  }
}
