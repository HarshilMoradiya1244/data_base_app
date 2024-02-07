import 'package:data_base/screen/category/controller/category_controller.dart';
import 'package:data_base/utils/dta_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController txtCategory = TextEditingController();
  var key = GlobalKey<FormState>();
  CategoryController controller = Get.put(CategoryController());

  @override
  void initState() {
    super.initState();
    controller.getCategory();
  }

  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Choose Category"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: txtCategory,
                  decoration: const InputDecoration(
                    label: Text("Category"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Category is Required";
                    } else {
                      null;
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      DbHelper helper = DbHelper();
                      helper.insertCategory(name: txtCategory.text);
                      controller.getCategory();
                    }
                  },
                  child: const Text("Add Category"),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                  '${controller.categoryList[index]['name']}'),
                              trailing: IconButton(
                                onPressed: () {
                                  DbHelper helper = DbHelper();
                                  helper.categoryDelete(
                                      id: "${controller.categoryList[index]['id']}");
                                  controller.getCategory();
                                },
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ),
                            const Divider()
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
