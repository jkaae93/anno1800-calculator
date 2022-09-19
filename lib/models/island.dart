// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:anno_calc/models/populration.dart';
import 'package:anno_calc/utils/enums.dart';

import 'goods.dart';

class Island {
  final int region;
  final List<Populration> populration;
  final String name;
  final List<Goods> defaultGoods;
  final List<Goods> productions;

  Island({
    this.region = 0,
    required this.populration,
    this.name = '',
    required this.defaultGoods,
    required this.productions,
  });

  Island copyWith({
    int? region,
    List<Populration>? populration,
    String? name,
    List<Goods>? defaultGoods,
    List<Goods>? productions,
  }) {
    return Island(
      region: region ?? this.region,
      populration: populration ?? this.populration,
      name: name ?? this.name,
      defaultGoods: defaultGoods ?? this.defaultGoods,
      productions: productions ?? this.productions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'region': region,
      'populration': populration.map((x) => x.toMap()).toList(),
      'name': name,
      'defaultGoods': defaultGoods.map((x) => x.toMap()).toList(),
      'productions': productions.map((x) => x.toMap()).toList(),
    };
  }

  factory Island.fromMap(Map<String, dynamic> map) {
    return Island(
      region: map['region'] ?? 0,
      populration: map['populration'] != null && map['populration'].isNotEmpty ? map['populration'].map<Populration>((x) => Populration.fromMap(x)).toList() : [],
      name: map['name'] ?? '',
      defaultGoods: map['defaultGoods'] != null && map['defaultGoods'].isNotEmpty ? map['defaultGoods'].map<Goods>((x) => Goods.fromMap(x)).toList() : [],
      productions: map['productions'] != null && map['productions'].isNotEmpty ? map['productions'].map<Goods>((x) => Goods.fromMap(x)).toList() : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Island.fromJson(String source) => Island.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Island(region: $region, populration: $populration, name: $name, defaultGoods: $defaultGoods, productions: $productions)';
  }

  @override
  bool operator ==(covariant Island other) {
    if (identical(this, other)) return true;

    return other.region == region && listEquals(other.populration, populration) && other.name == name && listEquals(other.defaultGoods, defaultGoods) && listEquals(other.productions, productions);
  }

  @override
  int get hashCode {
    return region.hashCode ^ populration.hashCode ^ name.hashCode ^ defaultGoods.hashCode ^ productions.hashCode;
  }

  factory Island.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Island(
      name: data?['name'] ?? '',
      defaultGoods: data?['default_goods'].map((e) => Goods.fromFirestore(snapshot, options)).toList(),
      populration: data?['populration'].map((e) => Populration.fromFirestore(snapshot, options)),
      productions: data?['productions'].map((e) => Goods.fromFirestore(snapshot, options)).toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }
}
