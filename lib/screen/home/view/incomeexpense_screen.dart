import 'package:data_base/model/incomeExpense_model.dart';
import 'package:data_base/utils/dta_base_helper.dart';
import 'package:flutter/material.dart';

class IncomeExpenseScreen extends StatefulWidget {
  const IncomeExpenseScreen({super.key});

  @override
  State<IncomeExpenseScreen> createState() => _IncomeExpenseScreenState();
}

class _IncomeExpenseScreenState extends State<IncomeExpenseScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtNotes = TextEditingController();

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
                decoration: const InputDecoration(label: Text("Title")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter The Title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: txtAmount,
                decoration: const InputDecoration(label: Text("Amount")),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter The Amount";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: txtCategory,
                decoration: const InputDecoration(label: Text("Category")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Category Is Required";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: txtNotes,
                decoration: const InputDecoration(label: Text("Notes")),
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
                        DBModel dbmodel = DBModel(
                          title: txtTitle.text,
                          amount: txtAmount.text,
                          category: txtCategory.text,
                          notes: txtNotes.text,
                          status: 0,
                        );
                        DbHelper dbHelper = DbHelper();
                        dbHelper.insertData(dbmodel);
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
