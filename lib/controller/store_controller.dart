import 'dart:html';
import 'package:anno_calc/models/island.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final Storage _localStorage = window.localStorage;
  List<Island> islandsInfo = [];

  static const String keyIslandInfos = 'key_islands_info';

  Future<void> save(String key, String data) async {
    _localStorage[key] = data;
  }

  Future<String> getId(String key) async => _localStorage[key] ?? '';

  Future invalidate({String key = ''}) async {
    if (key.isEmpty) {
      _localStorage.clear();
    } else {
      _localStorage.remove(key);
    }
  }
}
