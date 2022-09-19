import 'package:anno_calc/utils/enums.dart';

import 'package:get/get.dart';

class ResidentCounterController extends GetxController {
  @override
  void update([List<Object>? ids, bool condition = true]) {
    super.update(ids, condition);
  }

  final RxMap selectedRegion = Map.from({
    Region.oldWorld: true,
    Region.newWorld: true,
    Region.trelawney: true,
    Region.arctic: true,
    Region.enbesa: true,
  }).obs;

  RxBool useResidences = RxBool(false);
  final RxMap populrations = Map.from({
    Region.oldWorld: {
      CitizenTypes.farmers: RxInt(1),
      CitizenTypes.workers: RxInt(1),
      CitizenTypes.artisans: RxInt(1),
      CitizenTypes.engineers: RxInt(1),
      CitizenTypes.investors: RxInt(1),
      CitizenTypes.scholars: RxInt(1),
    },
    Region.newWorld: {
      CitizenTypes.jornaleros: RxInt(1),
      CitizenTypes.obreros: RxInt(1),
    },
    Region.trelawney: {
      CitizenTypes.farmers: RxInt(1),
      CitizenTypes.workers: RxInt(1),
      CitizenTypes.artisans: RxInt(1),
      CitizenTypes.engineers: RxInt(1),
      CitizenTypes.investors: RxInt(1),
      CitizenTypes.scholars: RxInt(1),
    },
    Region.arctic: {
      CitizenTypes.explorers: RxInt(1),
      CitizenTypes.technicians: RxInt(1),
    },
    Region.enbesa: {
      CitizenTypes.sheperds: RxInt(1),
      CitizenTypes.elders: RxInt(1),
    },
  }).obs;
}
