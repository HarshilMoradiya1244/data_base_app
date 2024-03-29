import 'package:data_base/model/incomeExpense_model.dart';
import 'package:data_base/screen/category/controller/category_controller.dart';
import 'package:data_base/screen/home/controller/home_controller.dart';
import 'package:data_base/utils/dta_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeExpenseScreen extends StatefulWidget {
  const IncomeExpenseScreen({super.key});

  @override
  State<IncomeExpenseScreen> createState() => _IncomeExpenseScreenState();
}

class _IncomeExpenseScreenState extends State<IncomeExpenseScreen> {
  DBModel? dbModel = Get.arguments;
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtNotes = TextEditingController();
  CategoryController controller = Get.put(CategoryController());
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getCategory();
    if (dbModel != null) {
       txtTitle =
          TextEditingController(text: dbModel!.title);
       txtAmount =
          TextEditingController(text: dbModel!.amount);
       txtNotes =
          TextEditingController(text: dbModel!.notes);
      // controller.selectedCategory.value = dbModel!.category

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Income Expanse"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: txtTitle,
                decoration: const InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter The Title";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtAmount,
                decoration: const InputDecoration(
                  label: Text("Amount"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter The Amount";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => DropdownButton(
                  isExpanded: true,
                  value: controller.selectedCategory.value,
                  hint: const Text("Select"),
                  items: controller.categoryList
                      .map(
                        (e) => DropdownMenuItem(
                          value: "${e['name']}",
                          child: Text("${e['name']}"),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.selectedCategory.value = value as String;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtNotes,
                decoration: const InputDecoration(
                  label: Text("Notes"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Date : 6/02/2024"),
                  Text("Time : 5:00 PM"),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        DBModel model = DBModel(
                          id: dbModel?.id,
                          title: txtTitle.text,
                          amount: txtAmount.text,
                          category: txtCategory.text,
                          notes: txtNotes.text,
                          status: 0,
                        );
                        if (dbModel == null) {
                          DbHelper dbHelper = DbHelper();
                          dbHelper.insertData(model);
                        } else {
                          DbHelper dbHelper = DbHelper();
                          dbHelper.incomeExpenseUpdate(model);
                        }
                        homeController.getData();
                        Get.back();
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.06,
                        width: MediaQuery.sizeOf(context).width * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Income",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),


                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        DBModel model = DBModel(
                          id: dbModel?.id,
                          title: txtTitle.text,
                          amount: txtAmount.text,
                          category: txtCategory.text,
                          notes: txtNotes.text,
                          status: 1,
                        );
                        if (dbModel == null) {
                          DbHelper dbHelper = DbHelper();
                          dbHelper.insertData(model);
                        } else {
                          DbHelper dbHelper = DbHelper();
                          dbHelper.incomeExpenseUpdate(model);
                        }
                        homeController.getData();
                        Get.back();
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.06,
                        width: MediaQuery.sizeOf(context).width * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Expense",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
