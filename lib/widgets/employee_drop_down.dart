import 'package:flutter/material.dart';
import 'package:flutter_data_tables/controllers/employee_controller.dart';
import 'package:get/get.dart';

class EmployeeDropDown extends StatefulWidget {
  const EmployeeDropDown({
    Key? key,
  }) : super(key: key);
  //final List items;

  @override
  _EmployeeDropDownState createState() => _EmployeeDropDownState();
}

class _EmployeeDropDownState extends State<EmployeeDropDown> {
  EmployeeController employeeController = Get.put(EmployeeController());
// Initial Selected Value
  late String dropdownvalue;

// List of items in our dropdown menu
  List<DropdownMenuItem<String>>? items = [];
  @override
  void initState() {
    super.initState();
    items = employeeController
        .buildLocationMenuItems(employeeController.getLocations());

    dropdownvalue = employeeController.employeeNames[0];
    // print(employeeController
    //     .buildLocationMenuItems(employeeController.getLocations()));
    // print("items :$items");
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
              isExpanded: true,
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: employeeController.employeeNames.map((String item) {
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
                });
                employeeController.filterEmployeesByLocation(newValue!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
