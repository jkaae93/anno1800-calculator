
import 'package:anno_calc/i18n/i18n.dart';
import 'package:anno_calc/models/trade_route.dart';
import 'package:anno_calc/utils/anno_database.dart';
import 'package:anno_calc/views/add_route_view.dart';
import 'package:anno_calc/views/trade_route_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/item_views.dart';

class TradeRoutesPage extends GetView<TradeRouteController> {
  final TradeRouteController _ctrl = Get.put(TradeRouteController());
  TradeRoutesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TradeRouteController>(initState: (state) {
      AnnoDatabase.instance.getUser().then((value) {
        controller.userData = value;
        controller.update();
      });
    }, builder: (context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('trade_routes'.tr),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'add_routes'.tr,
                        content: Container(width: 800, height: 800, child: AddRouteView(controller)),
                        onConfirm: () {
                          controller.addTradeRoute();
                          AnnoDatabase.instance.getUserData.tradeRoute.clear();
                          AnnoDatabase.instance.getUserData.tradeRoute.addAll(controller.routes as List<TradeRoute>);
                          AnnoDatabase.instance.updateUserData();
                          Get.back();
                        },
                        onCancel: () => Get.back(),
                      );
                    },
                    child: Container(
                      child: Row(
                        children: [
                          const Icon(Icons.linear_scale_sharp),
                          Text('add_routes'.tr),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: controller.userData.value.tradeRoute
                    .map<Widget>((e) => TradeSummary(
                          onClick: () {
                            // Get.defaultDialog();
                          },
                          route: [e.start, e.end],
                          products: e.products,
                          duration: e.duration,
                          name: e.name,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      );
    });
  }
}
