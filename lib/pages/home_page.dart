import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/employee_controller.dart';
import '../data/data.dart';
import '../stores/employee_store.dart';
import '../utils/dimensions.dart';
import '../utils/styles.dart';
import '../widgets/filter_widgets.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EmployeeController employeeController = Get.put(EmployeeController());
  EmployeeStore employeeStore = EmployeeStore();
  late ScrollController _verticalScrollController;
  late ScrollController _horizontalScrollController;
  late List<Map<String, dynamic>> _employees;
  late List<String> workingDays;
  bool showFilters = false;
  @override
  void initState() {
    super.initState();
    _verticalScrollController = ScrollController();
    _horizontalScrollController = ScrollController();
    var result = getEmployees();
    _employees = result["employees"];
    getWorkingDays(_employees[0]["workingHours"]);
    employeeController.getEmployeesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.blueColor,
        leadingWidth: Dimensions.getWidth(110),
        leading: Container(
          margin: EdgeInsets.only(left: Dimensions.getWidth(20)),
          height: Dimensions.getHeight(64),
          width: Dimensions.getWidth(110),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('lib/assets/images/logo_black_long.png'))),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: Dimensions.getWidth(20)),
            height: Dimensions.getHeight(24.02),
            width: Dimensions.getWidth(23.69),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image:
                        AssetImage('lib/assets/images/notification_bell.png'))),
          ),
          SizedBox(width: Dimensions.getWidth(20)),
          SizedBox(
              height: Dimensions.getHeight(40),
              width: Dimensions.getHeight(40),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage:
                    AssetImage('lib/assets/images/barber_shop.png'),
              )),
          SizedBox(width: Dimensions.getWidth(16)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Employee',
                style: TextStyle(
                    color: Color(0xff1d252d),
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.amberAccent, width: 3))),
                  child: const Text(
                    'Working hours',
                    style: TextStyle(
                        color: Color(0xff1d252d),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  decoration: const BoxDecoration(
                      // border: Border(
                      //     bottom:
                      //         BorderSide(color: Colors.amberAccent, width: 3)),
                      ),
                  child: const Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[300],
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFilters = !showFilters;
                      });
                    },
                    child: SizedBox(
                        height: Dimensions.getHeight(45),
                        width: Dimensions.getWidth(45),
                        child: Stack(
                          children: [
                            Positioned(
                              top: Dimensions.getHeight(1),
                              right: Dimensions.getWidth(0),
                              child: Container(
                                height: Dimensions.getHeight(12),
                                width: Dimensions.getWidth(12),
                                decoration: const BoxDecoration(
                                    color: Colors.amberAccent,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.getWidth(10),
                                vertical: Dimensions.getHeight(5),
                              ),
                              height: Dimensions.getHeight(40),
                              width: Dimensions.getWidth(40),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/filter_icon.png'),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            showFilters
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          height: 120,
                          width: Dimensions.screenWidth,
                          color: Colors.transparent,
                          child: const FilterWidgets()),
                    ],
                  )
                : SizedBox(),
            AnimatedContainer(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              duration: const Duration(milliseconds: 100),
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
                        child:
                            GetBuilder<EmployeeController>(builder: (context) {
                          return DataTable(
                              columnSpacing: 20,
                              horizontalMargin: 5,
                              border: TableBorder.all(
                                  color: Colors.grey[400] as Color,
                                  borderRadius: BorderRadius.circular(10)),
                              columns: employeeController
                                  .getDayColumns(_employees[0]["workingHours"]),
                              rows: employeeController.getEmployeeRows());
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
