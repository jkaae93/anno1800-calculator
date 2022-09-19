import 'package:anno_calc/models/citizen.dart';
import 'package:anno_calc/models/goods.dart';
import 'package:anno_calc/models/island.dart';
import 'package:anno_calc/models/production.dart';
import 'package:anno_calc/models/user_data.dart';
import 'package:anno_calc/utils/enums.dart';
import 'package:get/get.dart';

class IslandsInfoController extends GetxController {
  Rx<UserData> _userData = Rx<UserData>(UserData(islands: [], tradeRoute: []));
  Rx<Region> _region = Rx<Region>(Region.oldWorld);
  Island? info;

  RxList _defaultProduct = List.empty().obs;
  RxList _production = List.empty().obs;
  RxMap _populration = Map.from({}).obs;
  RxString _name = ''.obs;

  String get name => _name.value;

  set name(String value) => _name = value.obs;

  Region get region => _region.value;

  set region(Region value) => _region = Rx<Region>(value);

  RxList get defaultProduct => _defaultProduct;

  set defaultProduct(value) => _defaultProduct = value;

  RxList get production => _production;

  set production(value) => _production = value;

  RxMap get populration => _populration;

  void setPopulration(CitizenTypes type, int count) {
    _populration[type] = count;
    update();
  }

  void addDefaultProduct(RawMaterials goods, bool checked) {
    if (!checked) {
      _defaultProduct.remove(goods);
    } else {
      _defaultProduct.add(goods);
    }
    update();
  }

  void addProduction(IntermediateGoods goods, bool checked) {
    if (!checked) {
      _production.remove(goods);
    } else {
      _production.add(goods);
    }
    update();
  }

  set populration(value) => _populration = value;

  set userData(value) {
    _userData = Rx<UserData>(value);
    update();
  }

  get userData => _userData;
}
