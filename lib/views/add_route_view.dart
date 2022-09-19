import 'package:anno_calc/models/island.dart';
import 'package:anno_calc/views/pages/item_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:steps_indicator/steps_indicator.dart';

import 'trade_route_controller.dart';

class AddRouteView extends StatelessWidget {
  final TradeRouteController controller;
  AddRouteView(this.controller, {Key? key}) : super(key: key);
  final RxMap _selected = Map.from({'start': null, 'end': null}).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TradeRouteController>(builder: (ctx) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text('name'.tr, style: context.theme.textTheme.titleSmall),
                  TextField(
                    decoration: const InputDecoration(
                      constraints: BoxConstraints.expand(height: 50, width: 150),
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (value) {
                      controller.name = value.obs;
                    },
                  ),
                ],
              ),
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<Island>(
                      isDense: true,
                      isExpanded: false,
                      hint: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text('start'.tr),
                      ),
                      value: controller.getStart(),
                      items: (controller.userData.value.islands as List<Island>)
                          .map((i) => DropdownMenuItem<Island>(
                                value: i,
                                child: Text(i.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.setStart(value);
                      },
                    ),
                    StepsIndicator(
                      nbSteps: 3,
                      selectedStep: 1,
                      selectedStepWidget: Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          decoration: const InputDecoration(constraints: BoxConstraints.expand(height: 50, width: 150), hintText: 'duration'),
                          onChanged: (v) {
                            controller.duration = (int.tryParse(v) ?? 0).obs;
                            controller.update();
                          },
                        ),
                      ),
                      lineLength: 150,
                    ),
                    DropdownButton<Island>(
                      hint: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text('end'.tr),
                      ),
                      isDense: true,
                      isExpanded: false,
                      value: controller.getEnd(),
                      items: (controller.userData.value.islands as List<Island>)
                          .map((i) => DropdownMenuItem<Island>(
                                value: i,
                                child: Text(i.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.setEnd(value);
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text('product'),
                  Wrap(
                    children: (controller.userData.value.islands as List<Island>)
                        .where(
                          (e) => controller.getStart() != null && controller.getStart()!.name == e.name,
                        )
                        .map(
                          (e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: e.defaultGoods
                                    .map((e) => TradeSelecter(
                                        product: e.name,
                                        onChanged: (v, q) {
                                          e.quantity = q;
                                          if (v) {
                                            controller.goods.add(e);
                                          } else {
                                            controller.goods.remove(e);
                                          }
                                          controller.update();
                                        }))
                                    .toList(),
                              ),
                              Wrap(
                                children: e.productions
                                    .map((e) => TradeSelecter(
                                        product: e.name,
                                        onChanged: (v, q) {
                                          e.quantity = q;
                                          if (!v) {
                                            controller.goods.add(e);
                                          } else {
                                            controller.goods.remove(e);
                                          }
                                          controller.update();
                                        }))
                                    .toList(),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
