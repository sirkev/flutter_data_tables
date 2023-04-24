import 'package:flutter/material.dart';

import 'appointment_cell.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _verticalScrollController;
  late ScrollController _horizontalScrollController;
  @override
  void initState() {
    super.initState();
    _verticalScrollController = ScrollController();
    _horizontalScrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
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
                      columns: _getDayColumns(),
                      rows: _getEmployeeRows()),
                ),
              ),
            ),
          ),
        ),
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
    List<DataRow> rows = [];
    for (String staff in staffNames) {
      rows.add(DataRow(cells: [
        DataCell(Text(staff)),
        DataCell(AppointmentCell()),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
      ]));
    }

    return rows;
  }

  List<DataColumn> _getDayColumns() {
    List<DataColumn> columns = [];
    columns.add(
      DataColumn(
          label: Text(
        'Change Staff',
        style:
            TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w700),
      )),
    );
    for (String day in days) {
      columns.add(
        DataColumn(label: Text(day.toUpperCase())),
      );
    }
    print('${columns.length}');

    return columns;
  }
}
