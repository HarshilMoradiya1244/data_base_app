import 'package:data_base/utils/dta_base_helper.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

RxList<Map> categoryList =<Map>[].obs;
RxnString selectedCategory = RxnString();

Future<void> getCategory()async{

  DbHelper helper = DbHelper();
  List<Map> category = await helper.readCategory();
  categoryList.value = category;
}

}