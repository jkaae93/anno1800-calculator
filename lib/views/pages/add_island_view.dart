import 'package:anno_calc/controller/islands_info_controller.dart';
import 'package:anno_calc/utils/enums.dart';
import 'package:anno_calc/views/pages/item_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddIslandsView extends StatefulWidget {
  final BuildContext parentContext;
  final IslandsInfoController control;
  const AddIslandsView(this.parentContext, this.control, {super.key});

  @override
  State<AddIslandsView> createState() => _AddIslandsViewState();
}

class _AddIslandsViewState extends State<AddIslandsView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text('region'.tr, style: context.theme.textTheme.titleSmall),
                      ),
                      Obx(
                        () => DropdownButton<Region>(
                          isDense: true,
                          isExpanded: false,
                          value: widget.control.region,
                          items: Region.values
                              .map((e) => DropdownMenuItem<Region>(
                                    value: e,
                                    child: Text(e.name),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              widget.control.region = value ?? widget.control.region;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('name'.tr, style: context.theme.textTheme.titleSmall),
                      TextField(
                        decoration: const InputDecoration(
                          constraints: BoxConstraints.expand(height: 50, width: 150),
                          border: UnderlineInputBorder(),
                        ),
                        onChanged: (value) {
                          widget.control.name = value;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('population'.tr, style: context.theme.textTheme.titleMedium),
                StatefulBuilder(builder: (context, setState) {
                  int start = 0, end = 0;
                  switch (widget.control.region) {
                    case Region.oldWorld:
                    case Region.trelawney:
                      end = 6;
                      break;
                    case Region.newWorld:
                      start = 6;
                      end = 8;
                      break;
                    case Region.arctic:
                      start = 8;
                      end = 10;
                      break;
                    case Region.enbesa:
                      start = 10;
                      end = 12;
                      break;
                    default:
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: CitizenTypes.values
                        .sublist(start, end)
                        .map((e) => CitizenCounter(
                              count: 0,
                              useResidences: false,
                              name: e.name,
                              onChanged: (count) {
                                widget.control.setPopulration(e, count);
                              },
                            ))
                        .toList(),
                  );
                })
              ],
            ),
            Column(
              children: [
                Text('specialites'.tr, style: context.theme.textTheme.titleSmall),
                StatefulBuilder(builder: (context, setState) {
                  return Wrap(
                    children: RawMaterials.values
                        .where((element) => _isEnabeldRaw(widget.control.region, element))
                        .map((e) => ItemSelecter(
                              product: e.name,
                              onChanged: (v) {
                                widget.control.addDefaultProduct(e, v);
                              },
                            ))
                        .toList(),
                  );
                }),
              ],
            ),
            Column(
              children: [
                Text('production'.tr, style: context.theme.textTheme.titleSmall),
                StatefulBuilder(builder: (context, setState) {
                  return Wrap(
                    children: IntermediateGoods.values
                        .where((element) => _isEnabeldIntermediate(widget.control.region, element))
                        .map((e) => ItemSelecter(
                              product: e.name,
                              onChanged: (v) {
                                widget.control.addProduction(e, v);
                              },
                            ))
                        .toList(),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool _isEnabeldRaw(Region region, RawMaterials material) {
    if (region == Region.oldWorld && material.fromOld || region == Region.trelawney && material.fromOld) {
      return true;
    } else if (material.fromArctic && region == Region.arctic) {
      return true;
    } else if (material.fromEnbesa && region == Region.enbesa) {
      return true;
    } else if (material.fromNew && region == Region.newWorld) {
      return true;
    } else if (material.fromOld && region == Region.oldWorld) {
      return true;
    } else {
      return false;
    }
  }

  bool _isEnabeldIntermediate(Region region, IntermediateGoods material) {
    if (region == Region.oldWorld && material.fromOld || region == Region.trelawney && material.fromOld) {
      return true;
    } else if (material.fromArctic && region == Region.arctic) {
      return true;
    } else if (material.fromEnbesa && region == Region.enbesa) {
      return true;
    } else if (material.fromNew && region == Region.newWorld) {
      return true;
    } else if (material.fromOld && region == Region.oldWorld) {
      return true;
    } else {
      return false;
    }
  }
}
