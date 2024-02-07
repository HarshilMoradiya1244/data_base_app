import 'package:data_base/screen/dash/controller/dash_controller.dart';
import 'package:data_base/screen/graph/view/graph_screen.dart';
import 'package:data_base/screen/home/view/incomeexpense_screen.dart';
import 'package:data_base/screen/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashController controller = Get.put(DashController());

  List screen = [
    const IncomeExpenseScreen(),
    const GraphScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => screen[controller.stepIndex.value]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.stepIndex.value,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "home"),
            NavigationDestination(icon: Icon(Icons.auto_graph_outlined), label: "graph"),
            NavigationDestination(icon: Icon(Icons.settings), label: "setting"),
          ],
        ),
      ),
    );
  }
}
