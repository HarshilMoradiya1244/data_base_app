import 'package:data_base/utils/dta_base_helper.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

RxList categoryList = [].obs;

void getCategory()async{

  DbHelper helper = DbHelper();
  await helper.readCategory();
}

}