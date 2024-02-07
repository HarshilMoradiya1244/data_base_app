import 'dart:ffi';

import 'package:data_base/screen/dash/controller/dash_controller.dart';
import 'package:data_base/screen/home/view/home_screen.dart';
import 'package:data_base/screen/graph/view/graph_screen.dart';
import 'package:data_base/screen/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashController controller = Get.put(DashController());

  List<Widget> screen = [
    const HomeScreen(),
    const GraphScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => PageView(
          controller: controller.pageController.value,
          onPageChanged: (value) {
            screen[controller.stepIndex.value];
          },
          children: screen,
        )),

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
