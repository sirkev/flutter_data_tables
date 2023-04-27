import 'package:flutter/material.dart';
import 'package:flutter_data_tables/widgets/service_drop_down.dart';

import '../utils/dimensions.dart';
import 'employee_drop_down.dart';
import 'location_drop_down.dart';

class FilterWidgets extends StatefulWidget {
  const FilterWidgets({Key? key}) : super(key: key);

  @override
  State<FilterWidgets> createState() => _FilterWidgetsState();
}

class _FilterWidgetsState extends State<FilterWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              height: Dimensions.getHeight(44),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius4),
                  border: Border.all(color: Colors.grey)),
              child: ServiceDropDown(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              height: Dimensions.getHeight(44),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius4),
                  border: Border.all(color: Colors.grey)),
              child: LocationDropDown(),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              height: Dimensions.getHeight(44),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius4),
                  border: Border.all(color: Colors.grey)),
              child: EmployeeDropDown(),
            ),
          ],
        ),
      ),
    );
  }
}
