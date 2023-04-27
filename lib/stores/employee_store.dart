import 'package:mobx/mobx.dart';

import '../data/data.dart';
import '../models/employee_model.dart';

part 'employee_store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;

abstract class _EmployeeStore with Store {
  @observable
  List employees = [];

  @action
  List getEmployeesData() {
    var result = getEmployees();
    var employeesList = result["employees"];
    for (var i = 0; employeesList.length < 1; i++) {
      employees.add(Employee(
        employeesList[i]["name"],
        employeesList[i]["avatarUrl"],
        employeesList[i]["location"],
      ));
    }
    print(employees);
    return employees;
  }
}
