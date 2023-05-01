import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/data.dart';
import '../models/employee_model.dart';
import '../widgets/appointment_cell.dart';
import '../widgets/staff_cell.dart';

class EmployeeController extends GetxController {
  List<String> _locationItems = [];
  List<String> get locationItems => _locationItems;

  List<Employee> _employees = [];
  List<Employee> get employees => _employees;

  List<String> _employeeNames = [];
  List<String> get employeeNames => _employeeNames;

  List getEmployeesData() {
    var result = getEmployees();
    var employeesList = result["employees"];
    for (var i = 0; i < employeesList.length; i++) {
      _employees.add(Employee(
        employeesList[i]["name"],
        employeesList[i]["avatarUrl"],
        employeesList[i]["location"],
      ));
    }
    update();
    return employees;
  }

  List<DataRow> getEmployeeRows() {
    List<DataRow> rows = List.generate(_employees.length, (index) {
      // _employeeNames.insert(0, "All Employees");
      for (var i = 0; i < _employees.length; i++) {
        _employeeNames.add(_employees[index].name);
      }
      var employeeSet = _employeeNames.toSet();
      var employeeNamesSet = employeeSet.toList();
      _employeeNames = employeeNamesSet;

      return DataRow(cells: [
        DataCell(StaffCell(
          name: _employees[index].name,
          id: '${_employees[index]}',
          imageUrl: _employees[index].avatarUrl,
          isWorking: Random().nextBool(),
          hours: '${Random().nextInt(16).clamp(1, 16)}h',
        )),
        const DataCell(AppointmentCell(
          workingHours: '',
        )),
        const DataCell(Text('')),
        const DataCell(Text('')),
        const DataCell(Text('')),
        const DataCell(Text('')),
        const DataCell(Text('')),
        const DataCell(Text('')),
      ]);
    });
    //update();
    return rows;
  }

  List<DataColumn> getDayColumns(Map<String, dynamic> workingHours) {
    List<DataColumn> columns = [];
    columns.add(const DataColumn(
        label: Text('Change Staff',
            style: TextStyle(
                color: Colors.amberAccent, fontWeight: FontWeight.w700))));
    workingHours.forEach((key, value) {
      String reversedKey = reverseDateFormats(key);
      DateTime parsedKeys = parseDate(reversedKey);
      columns.add(DataColumn(
          label: Center(
        child: Text(getWeekdayFromDate(parsedKeys),
            style: const TextStyle(
                color: Color(0xff1d252d), fontWeight: FontWeight.w700)),
      )));
    });

    return columns;
  }

  List<String> getLocations() {
    List<String> locations = [];
    for (var element in _employees) {
      locations.add(element.location);
    }
    _locationItems = locations;
    var locationSet = locations.toSet();
    _locationItems = locationSet.toList();
    _locationItems.insert(0, "All locations");
    return locations;
  }

  void filterEmployeesByLocation(String value) {
    getEmployeesData();
    List<Employee> filterList = [];
    List<String> employeeNamesFiltered = [];

    for (var element in _employees) {
      if (value == 'All locations') {
        filterList = _employees;
        employeeNamesFiltered = _employeeNames;
      }
      if (element.location == value) {
        filterList.add(element);
        employeeNamesFiltered.add(element.name);
      }
    }

    _employeeNames = employeeNamesFiltered;
    _employees = filterList;
    update();
  }

  void filterEmployeeName(String value) {
    List<Employee> filterList = [];
    for (var element in _employees) {
      if (element.name == value) {
        filterList.add(element);
      }
    }
    _employees = filterList;
    update();
  }

  void getFirstEmployListItem() {
    _employeeNames.insert(0, "All employees");
  }

  //gets list of locations
  List<DropdownMenuItem<String>>? buildLocationMenuItems(
      List<String> getLocations) {
    List<DropdownMenuItem<String>>? menuItems = [];

    getLocations
        .map((String locationItem) =>
            DropdownMenuItem(value: locationItem, child: Text(locationItem)))
        .toList();
    return menuItems;
  }

  void resetEmployeeNamesList() {
    getEmployeeRows();
  }

  @override
  void onInit() {
    super.onInit();
    getFirstEmployListItem();
  }
}
