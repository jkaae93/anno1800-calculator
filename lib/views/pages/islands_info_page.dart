import 'package:anno_calc/controller/islands_info_controller.dart';
import 'package:anno_calc/models/goods.dart';
import 'package:anno_calc/models/island.dart';
import 'package:anno_calc/models/populration.dart';
import 'package:anno_calc/utils/anno_database.dart';
import 'package:anno_calc/views/pages/item_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_island_view.dart';

class IslandsInfoPage extends GetView<IslandsInfoController> {
  IslandsInfoPage({Key? key}) : super(key: key);

  final IslandsInfoController _info = Get.put(IslandsInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<IslandsInfoController>(initState: (state) {
        AnnoDatabase.instance.getUser().then((value) {
          controller.userData = AnnoDatabase.instance.getUserData;
        });
      }, builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text('islands_info'.tr),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'add_islands'.tr,
                        onConfirm: () {
                          controller.info = Island(
                            region: controller.region.index,
                            name: controller.name,
                            populration: controller.populration.entries.map((e) => Populration(type: e.key.value, name: e.key.name, count: e.value)).toList(),
                            defaultGoods: controller.defaultProduct.map<Goods>((e) => Goods(name: e.name, region: controller.region.index, type: 0)).toList(),
                            productions: controller.production.map((e) => Goods(name: e.name, region: controller.region.index, type: 2)).toList(),
                          );
                          AnnoDatabase.instance.getUserData.islands.add(controller.info!);
                          AnnoDatabase.instance.updateUserData();
                          controller.userData = AnnoDatabase.instance.getUserData;
                          controller.update();
                          Get.back();
                        },
                        onCancel: () => Get.back(),
                        content: SizedBox(width: 800, height: 800, child: AddIslandsView(context, controller)),
                      );
                    },
                    child: Container(
                      child: Row(
                        children: [
                          const Icon(Icons.add_location_alt),
                          Text('add_island'.tr),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              controller.userData.value.islands.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 300,
                      child: Column(
                        children: const [
                          Icon(Icons.block),
                          Text('This is empty'),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: controller.userData.value.islands
                              .map<Widget>(
                                (e) => IslandsView(
                                  name: e.name,
                                  population: e.populration,
                                  specialties: e.defaultGoods,
                                  productions: e.productions,
                                ),
                              )
                              .toList(),
                        );
                      }),
            ],
          )),
        );
      }),
    );
  }
}
