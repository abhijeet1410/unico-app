import 'package:flutter/material.dart';
import 'package:flutter_template_3/pages/utils/home_api_provider.dart';
import 'package:flutter_template_3/utils/app_storage_helper.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 09-07-2022 07:24 PM
///
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider provider = Get.put(HomeProvider());
  late HomeRepository repository = Get.put(HomeRepository(provider: provider));
  late HomeController controller =
      Get.put(HomeController(homeRepository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppStorageHelper.storeCounter(AppStorageHelper.counter);
        },
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(state[index].name),
            );
          },
        ),
      ),
    );
  }
}
