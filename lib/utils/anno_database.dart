import 'dart:html';

import 'package:anno_calc/models/demands_counter.dart';
import 'package:anno_calc/models/demands_model.dart';
import 'package:anno_calc/models/goods.dart';
import 'package:anno_calc/models/populration.dart';
import 'package:anno_calc/models/product.dart';
import 'package:anno_calc/models/region.dart';
import 'package:anno_calc/models/user_data.dart';
import 'package:anno_calc/utils/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AnnoDatabase extends GetxController {
  static AnnoDatabase? _instance;
  late FirebaseFirestore db;
  final Storage _localStorage = window.localStorage;

  // Avoid self isntance
  AnnoDatabase._() {
    db = FirebaseFirestore.instance;
    init();
  }

  static AnnoDatabase get instance {
    _instance ??= AnnoDatabase._();
    return _instance!;
  }

  Future<void> init() async {
    await getGoods();
    await getPopulration();
    await getRegion();
    await getDemands();
  }

  /// localStorage
  ///
  Future<void> saveId(String id) async => _localStorage['calc_uid'] = id;

  String getId() => _localStorage['calc_uid'] ?? '';

  void clearId() => _localStorage.remove('calc_uid');

  /// Firestore
  ///
  ///
  RxMap _demands = {}.obs;

  List get getDemandsList => (_demands.values).toList();

  List<DemandsGoods> getDemandsData(String type) {
    try {
      return _demands[type]!.rates;
    } catch (e) {
      return [];
    }
  }

  void add(String key, DemandsInfo model) => _demands[key] = model;

  final RxMap _goods = {}.obs;

  Goods getGoodsData(String name) {
    return _goods[name]!;
  }

  List get getGoodsList => _goods.values.toList();

  RxMap _populration = {}.obs;

  List get getPopulrationList => _populration.values.toList();

  Populration getPopulrationData(String name) {
    return _populration[name]!;
  }

  RxMap _regions = {}.obs;

  List get getRegionList => _regions.values.toList();

  RegionModel getRegionData(String name) {
    return _regions[name]!;
  }

  Rx<UserData> _userData = Rx<UserData>(UserData(tradeRoute: [], islands: []));

  UserData get getUserData => _userData.value;

  ///
  Future<dynamic> getDocs(String collection) async {
    var res = await db.collection(collection).get();
    update();
    return res.docs;
  }

  Future<void> getGoods() async {
    var res = await db
        .collection('goods')
        .withConverter<Goods>(
          fromFirestore: (snapshots, _) => Goods.fromMap(snapshots.data()!),
          toFirestore: (value, options) => value.toFirestore(),
        )
        .get();
    for (var tem in res.docs) {
      _goods[tem.data().name] = tem.data();
    }
    update();
  }

  Future<void> getPopulration() async {
    var res = await db
        .collection('populration')
        .withConverter<Populration>(
          fromFirestore: (s, _) => Populration.fromMap(s.data()!),
          toFirestore: (value, options) => value.toFirestore(),
        )
        .get();
    for (var pop in res.docs) {
      _populration[pop.data().name] = pop.data();
    }
    update();
  }

  Future<void> getRegion() async {
    var res = await db
        .collection('region')
        .withConverter<RegionModel>(
          fromFirestore: (s, _) => RegionModel.fromMap(s.data()!),
          toFirestore: (value, options) => value.toFirestore(),
        )
        .get();
    for (var reg in res.docs) {
      _regions[reg.data().name] = reg.data();
      update();
    }
  }

  Future<void> getDemands() async {
    var res = await db
        .collection('demands')
        .withConverter<DemandsInfo>(
          fromFirestore: (s, _) => DemandsInfo.fromMap(s.data()!),
          toFirestore: (value, options) => value.toFirestore(),
        )
        .get()
        .then((value) {
      for (var dem in value.docs) {
        _demands[dem.data().type] = dem.data();
      }
      update();
    });
    update();
  }

  Future<UserData> getUser() async {
    if (getId().isEmpty) return getUserData;
    var res = await db.collection('user_data').doc(getId()).get();
    _userData = Rx<UserData>(UserData.fromMap(res.data() ?? {}));
    update();
    return _userData.value;
  }

  Future<String> newUserData(UserData data) async {
    var res = await db.collection('user_data').add(data.toMap());
    update();
    return res.id;
  }

  Future<void> clearUserData() async {
    await db.collection('user_data').doc(getId()).set({});
    update();
  }

  Future<void> updateUserData() async {
    String id = getId();
    UserData data = _userData.value;
    if (id.isEmpty) {
      id = await newUserData(data);
      saveId(id);
    } else {
      await db.collection('user_data').doc(id).set(data.toMap());
    }
    update();

    print('end write: $id');
  }
}
