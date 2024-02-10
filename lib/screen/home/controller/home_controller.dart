import 'package:data_base/model/incomeExpense_model.dart';
import 'package:data_base/utils/dta_base_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<DBModel> dataList = <DBModel>[].obs;
  List<DBModel> filterList = [];

  Future<void> getData() async {
    DbHelper helper = DbHelper();
    List<DBModel> data = await helper.readIncomeExpense();
    dataList.value = data;
  }

  void liveSearch(String search) {
    filterList.clear();
    for (DBModel model in dataList) {
      if (model.category!.toLowerCase().contains(search.toLowerCase())) {
        filterList.add(model);
      }
    }
    dataList.value = List.from(filterList);
  }
  Future<void> filterData(int status) async {
    DbHelper helper = DbHelper();
    List<DBModel> data = await helper.filterIncomeExpense(status: status);
    dataList.value = data;
  }
}
