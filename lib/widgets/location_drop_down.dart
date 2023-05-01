import 'package:flutter/material.dart';
import 'package:flutter_data_tables/controllers/employee_controller.dart';
import 'package:get/get.dart';

class LocationDropDown extends StatefulWidget {
  const LocationDropDown({
    Key? key,
  }) : super(key: key);
  //final List items;

  @override
  _LocationDropDownState createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {
  EmployeeController employeeController = Get.put(EmployeeController());
  late String dropdownvalue;
  List<DropdownMenuItem<String>>? items = [];

  @override
  void initState() {
    super.initState();
    employeeController
        .buildLocationMenuItems(employeeController.getLocations());
    dropdownvalue = employeeController.locationItems[0];
    // print(employeeController
    //     .buildLocationMenuItems(employeeController.getLocations()));
    //print("items :$items");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              elevation: 0,
              enableFeedback: true,
              isExpanded: true,
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: employeeController.locationItems.map((String item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  employeeController.employeeNames[0] = "All Employees";
                });
                employeeController.filterEmployeesByLocation(newValue!);
                // employeeController.resetEmployeeNamesList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
