import 'package:anno_calc/utils/enums.dart';

class Product {
  int quantity = 0;
  int get getQuantity => quantity;
  set setQuantity(quantity) => this.quantity = quantity;

  Types type = Types.basic;
  Types get getType => type;
  set setType(type) => this.type = type;

  int id = 0;
  int get getId => id;
  set setId(id) => this.id = id;

  Region region = Region.oldWorld;
  Region get getRegion => region;
  set setRegion(type) => this.type = type;

  String name = '';
  String get getName => name;
  set setName(name) => this.name = name;

  String img = '';
  String get getImg => img;
  set setImg(img) => this.img = img;

  Product({
    this.img = '',
    this.name = '',
    this.quantity = 0,
    this.type = Types.basic,
    this.id = 0,
    this.region = Region.oldWorld,
  });
}
