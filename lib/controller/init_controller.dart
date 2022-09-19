import 'package:anno_calc/utils/anno_database.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  static InitController? _instance;
  static bool _isInitDb = false;

  InitController() {
    init().then((value) => _isInitDb = true);
  }

  static InitController get instance {
    _instance ??= InitController();
    if (!_isInitDb) init();
    return _instance!;
  }

  static Future<void> init() async {
    await AnnoDatabase.instance.getGoods();
    await AnnoDatabase.instance.getPopulration();
    await AnnoDatabase.instance.getRegion();
    await AnnoDatabase.instance.getDemands();
  }
}
