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
      child: Form(
        key: key,
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
                const SizedBox(height: 25,),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add Category"),
                ),
                SizedBox(height: 25,),
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text("CAtegoryName"),
                            trailing: IconButton(onPressed: (){},icon: Icon(Icons.delete_outline),),
                          ),
                          Divider()
                        ],
                      );
                    },
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
