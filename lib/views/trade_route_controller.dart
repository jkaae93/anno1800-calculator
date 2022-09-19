import 'package:anno_calc/models/goods.dart';
import 'package:anno_calc/models/island.dart';
import 'package:anno_calc/models/trade_route.dart';
import 'package:anno_calc/models/user_data.dart';
import 'package:anno_calc/utils/anno_database.dart';
import 'package:get/get.dart';

class TradeRouteController extends GetxController {
  Rx<UserData> _userData = Rx<UserData>(AnnoDatabase.instance.getUserData);

  get userData => _userData;

  set userData(value) => _userData = Rx<UserData>(value);

  List<TradeRoute> routes = [];

  Rx<TradeRoute> _info = Rx<TradeRoute>(TradeRoute(duration: 0, end: '', name: '', products: [], start: ''));

  RxString name = ''.obs;
  List<Goods> goods = [];

  RxInt duration = 0.obs;

  set route(info) {
    _info = info;
    update();
  }

  get route => _info.value;

  void addTradeRoute() {
    TradeRoute route = TradeRoute(
      name: name.value,
      products: goods,
      start: _map['start']!.name,
      end: _map['end']!.name,
      duration: duration.value,
    );
    routes.add(route);
    update();
  }

  final RxMap _map = {}.obs;

  void setStart(Island? island) {
    _map['start'] = island;
    update();
  }

  void setEnd(Island? island) {
    _map['end'] = island;
    update();
  }

  Island? getStart() {
    return _map['start'];
  }

  Island? getEnd() {
    return _map['end'];
  }
}
