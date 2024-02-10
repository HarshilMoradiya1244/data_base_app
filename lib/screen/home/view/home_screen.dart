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
                showFilterDialog();
              }, icon: const Icon(Icons.filter_alt_outlined)),
          IconButton(
              onPressed: () {
                Get.toNamed("category");
              },
              icon: const Icon(Icons.category))
        ],
      ),
      body: Column(
        children: [
          SearchBar(
            hintText: "Search Category",
            trailing: const [Icon(Icons.search)],
            elevation: MaterialStateProperty.all(1),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            onChanged: (value) {
              if (value.isEmpty) {
                controller.getData();
              } else {
                controller.liveSearch(value);
              }
            },
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed("update",
                          arguments: controller.dataList[index]);
                    },
                    child: Container(
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
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
                                      color:
                                          controller.dataList[index].status == 0
                                              ? Colors.green
                                              : Colors.red),
                                ),
                                const Text("Time : 5:00 PM"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('incomeExpense');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  void showFilterDialog(){
    showDialog(context:context , builder: (context) {
      return  AlertDialog(
        title: const Text("Filter"),
        content: Column(
          children: [
            Row(
              children: [
                ActionChip(label: const Text("All"),
                onPressed: (){
                  controller.getData();
                  Get.back();
                },),
                ActionChip(label: const Text("Income"),
                onPressed: (){
                  controller.filterData(0);
                  Get.back();
                },),
                ActionChip(label: const Text("Expense"),
                onPressed: (){
                  controller.filterData(1);
                  Get.back();
                },),
              ],
            )
          ],
        ),
      );
    },);
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
