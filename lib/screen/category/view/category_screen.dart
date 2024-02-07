import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController txtCategory = TextEditingController();
  var key = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Choose Category"),
        ),
        body: Column(
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
                })
          ],
        ),
      ),
    );
  }
}
