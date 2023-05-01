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
  late String dropdownvalue;

  List<DropdownMenuItem<String>>? items = [];
  @override
  void initState() {
    super.initState();
    employeeController.getEmployeeRows();
    if (employeeController.employeeNames[0] != "All Employees") {
      employeeController.employeeNames[0] = "All Employees";
    }
    dropdownvalue = employeeController.employeeNames[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonHideUnderline(
            child: GetBuilder<EmployeeController>(builder: (context) {
              return DropdownButton(
                elevation: 0,
                isExpanded: true,
                // Initial Value
                value: dropdownvalue,

                icon: const Icon(Icons.keyboard_arrow_down),

                items: employeeController.employeeNames.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                  employeeController.filterEmployeeName(newValue!);
                  // employeeController.filterEmployeesByLocation(newValue!);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
