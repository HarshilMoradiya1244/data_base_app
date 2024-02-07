import 'package:data_base/screen/graph/view/graph_screen.dart';
import 'package:data_base/screen/home/view/incomeexpense_screen.dart';
import 'package:data_base/screen/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const IncomeExpenseScreen(),
  'graph': (context) => const GraphScreen(),
  'setting': (context) => const SettingScreen(),
};
