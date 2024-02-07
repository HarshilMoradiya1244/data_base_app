import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashController extends GetxController {
  RxInt stepIndex = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
}
