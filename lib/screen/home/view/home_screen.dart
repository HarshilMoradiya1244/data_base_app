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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Data Screen"),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed("category");
          }, icon: const Icon(Icons.category))
        ],
      ),
      body:const Column(
        children: [

        ],
      ) ,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed('incomeExpense');
      },child: const Icon(Icons.add),),
    );
  }
}
