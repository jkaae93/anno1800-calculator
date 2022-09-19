import 'package:anno_calc/models/goods.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  List<Goods> _goods = [];

  List<Goods> get goods => _goods;
  set goods(value) => _goods = value;

  // TODO : Add assets
}
