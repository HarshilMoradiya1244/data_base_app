import 'package:data_base/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Data Screen"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("category");
              },
              icon: const Icon(Icons.category))
        ],
      ),
      body: Obx => ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${controller.dataList[index].title}",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: controller.dataList[index].status=="0"?Colors.green:Colors.red),),
              trailing: Text("${controller.dataList[index].amount}",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: controller.dataList[index].status=="0"?Colors.green:Colors.red),),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('incomeExpense');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
