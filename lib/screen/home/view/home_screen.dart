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
      body: Obx(
        () => ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height * 0.09,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("${controller.dataList[index].title}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Text("Date : 7/01/24"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "${controller.dataList[index].amount}",
                          style: TextStyle(
                              fontSize: 20,
                              color: controller.dataList[index].status == 0
                                  ? Colors.green
                                  : Colors.red),
                        ),
                        const Text("Time : 5:00 PM"),
                      ],
                    ),
                  ],
                ),
              ),
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
// return Column(
//   children: [
//     ListTile(
//       title: Text("${controller.dataList[index].title}",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//       trailing: Text("${controller.dataList[index].amount}",style:TextStyle(fontSize: 20,color: controller.dataList[index].status==0?Colors.green:Colors.red),),
//     ),
//     Divider(),
// ],
// );
