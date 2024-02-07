import 'package:data_base/model/incomeExpense_model.dart';
import 'package:data_base/utils/dta_base_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
RxList<DBModel>  dataList = <DBModel>[].obs;

Future<void> getData() async {
  DbHelper helper= DbHelper();
  List<DBModel> data = await helper.readIncomeExpense();
  dataList.value = data;
}
}