import 'package:data_base/screen/category/view/category_screen.dart';
import 'package:data_base/screen/dash/view/dash_screen.dart';
import 'package:data_base/screen/home/view/home_screen.dart';
import 'package:data_base/screen/graph/view/graph_screen.dart';
import 'package:data_base/screen/data_add/view/incomeexpense_screen.dart';
import 'package:data_base/screen/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const DashScreen(),
  'home': (context) => const HomeScreen(),
  'incomeExpense': (context) => const IncomeExpenseScreen(),
  'graph': (context) => const GraphScreen(),
  'setting': (context) => const SettingScreen(),
  'category': (context) => const CategoryScreen(),
};
