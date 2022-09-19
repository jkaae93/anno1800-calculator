import 'dart:html';

import 'package:anno_calc/controller/resident_counter_controller.dart';
import 'package:anno_calc/utils/anno_database.dart';
import 'package:anno_calc/utils/enums.dart';
import 'package:anno_calc/views/pages/item_views.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentDemandsPage extends GetView<ResidentCounterController> {
  final ResidentCounterController _init = Get.put(ResidentCounterController());
  ResidentDemandsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ResidentCounterController>(
        initState: (state) {
          AnnoDatabase.instance.getDemands().then((value) => controller.update());
        },
        builder: (getCtx) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: Text('resident_demands'.tr, style: context.theme.textTheme.titleLarge),
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: Region.values
                              .map(
                                (region) => Container(
                                  width: 150,
                                  height: 40,
                                  child: CheckboxListTile(
                                      dense: true,
                                      title: AutoSizeText(region.name, style: context.theme.textTheme.button),
                                      value: controller.selectedRegion[region] ?? false,
                                      onChanged: (value) {
                                        controller.selectedRegion[region] = value ?? false;
                                        getCtx.update();
                                      }),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text('use_residences'.tr, style: context.theme.textTheme.titleSmall),
                          Switch(
                            value: controller.useResidences.value,
                            thumbColor: context.theme.switchTheme.thumbColor,
                            activeTrackColor: context.theme.toggleableActiveColor,
                            hoverColor: context.theme.hoverColor,
                            trackColor: context.theme.switchTheme.trackColor,
                            overlayColor: context.theme.switchTheme.overlayColor,
                            inactiveTrackColor: context.theme.disabledColor,
                            activeColor: context.theme.toggleableActiveColor,
                            materialTapTargetSize: context.theme.materialTapTargetSize,
                            onChanged: (value) {
                              controller.useResidences = RxBool(value);
                              getCtx.update();
                            },
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            confirmTextColor: context.theme.primaryColorLight,
                            buttonColor: context.theme.highlightColor,
                            backgroundColor: context.theme.backgroundColor,
                            cancelTextColor: context.theme.primaryColorDark,
                            middleTextStyle: context.theme.textTheme.bodyText2,
                            titleStyle: context.theme.textTheme.titleSmall,
                            cancel: Text('cancel'.tr),
                            title: 'clear_all'.tr,
                            onCancel: () => Get.back(),
                            middleText: 'If press ok, clear all counts',
                            onConfirm: () {
                              controller.populrations.clear();
                              getCtx.update();
                              Get.back();
                            },
                          );
                        },
                        child: Text('clear_all'.tr, style: context.theme.textTheme.titleSmall),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.selectedRegion.length,
                      itemBuilder: (ctx, index) {
                        Region region = controller.selectedRegion.keys.toList()[index];
                        bool isShow = controller.selectedRegion[region] ?? false;
                        if (!isShow) return Container();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                              child: Text(region.name, style: context.theme.textTheme.bodyLarge),
                            ),
                            StatefulBuilder(builder: (ctx, state) {
                              return ResidentItemView(
                                counter: CitizenTypes.values
                                    .map((e) => Row(
                                          children: [
                                            CitizenCounter(
                                              count: controller.populrations[e] ?? 0,
                                              useResidences: controller.useResidences.value,
                                              name: e.name,
                                              rate: (e.value + 1) * 10,
                                              onChanged: (count) {
                                                controller.populrations[e] = count;
                                                getCtx.update();
                                              },
                                            ),
                                            GoodsList(
                                              population: controller.populrations[e] ?? 0,
                                              goods: AnnoDatabase.instance.getDemandsData(e.name),
                                              useResidence: controller.useResidences.value,
                                              rate: (e.index + 1) * 10,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              );
                            }),
                          ],
                        );
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
