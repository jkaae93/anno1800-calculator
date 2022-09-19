// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DemandsModel {
  final String type;
  final List<DemandsInfo> rate;
  DemandsModel({
    required this.type,
    required this.rate,
  });

  DemandsModel copyWith({
    String? type,
    List<DemandsInfo>? rate,
  }) {
    return DemandsModel(
      type: type ?? this.type,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'rate': rate.map((x) => x.toMap()).toList(),
    };
  }

  factory DemandsModel.fromMap(Map<String, dynamic> map) {
    return DemandsModel(
      type: map['type'] ?? '',
      rate: List<DemandsInfo>.from(
        (map['rate'] as List<int>).map<DemandsInfo>(
          (x) => DemandsInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DemandsModel.fromJson(String source) => DemandsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory DemandsModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final Map<String, dynamic> data = snapshot.data() ?? {};
    return DemandsModel(
      rate: data['rate'] != null ? data['rate'].map((e) => DemandsInfo.fromMap(e)).toList() : [],
      type: data['type'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (type != null) "type": type,
      if (rate != null) "rate": rate,
    };
  }

  @override
  String toString() => 'DemandsModel(type: $type, rate: $rate)';

  @override
  bool operator ==(covariant DemandsModel other) {
    if (identical(this, other)) return true;

    return other.type == type && listEquals(other.rate, rate);
  }

  @override
  int get hashCode => type.hashCode ^ rate.hashCode;
}

class DemandsInfo {
  final int region;
  final List<DemandsGoods> rates;
  final String type;

  DemandsInfo({
    required this.region,
    required this.rates,
    required this.type,
  });

  DemandsInfo copyWith({
    int? region,
    List<DemandsGoods>? rates,
    String? type,
  }) {
    return DemandsInfo(
      region: region ?? this.region,
      rates: rates ?? this.rates,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'region': region,
      'rates': rates.map((x) => x.toMap()).toList(),
      'type': type,
    };
  }

  factory DemandsInfo.fromMap(Map<String, dynamic> map) {
    return DemandsInfo(
      region: map['region'] as int,
      rates: map['rates'] != null ? List<DemandsGoods>.from(map['rates'].map<DemandsGoods>((x) => DemandsGoods.fromMap(x))) : [],
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DemandsInfo.fromJson(String source) => DemandsInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  factory DemandsInfo.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return DemandsInfo(
      type: data?['type'] ?? '',
      rates: data?['rates'] != null ? data!['rates'].map<DemandsGoods>((e) => DemandsGoods.fromFirestore(snapshot, options)).toList() : [],
      region: data?['region'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (rates != null) "rates": rates,
      if (region != null) "region": region,
    };
  }

  @override
  String toString() => 'DemandsInfo(region: $region, rates: $rates, type: $type)';

  @override
  bool operator ==(covariant DemandsInfo other) {
    if (identical(this, other)) return true;

    return other.region == region && listEquals(other.rates, rates) && other.type == type;
  }

  @override
  int get hashCode => region.hashCode ^ rates.hashCode ^ type.hashCode;
}

class DemandsGoods {
  final String name;
  final double rate;
  DemandsGoods({
    required this.name,
    required this.rate,
  });

  DemandsGoods copyWith({
    String? name,
    double? rate,
  }) {
    return DemandsGoods(
      name: name ?? this.name,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rate': rate,
    };
  }

  factory DemandsGoods.fromMap(Map<String, dynamic> map) {
    return DemandsGoods(
      name: map['name'] ?? '',
      rate: map['rate'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DemandsGoods.fromJson(String source) => DemandsGoods.fromMap(json.decode(source) as Map<String, dynamic>);

  factory DemandsGoods.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return DemandsGoods(
      name: data?['name'] ?? '',
      rate: data?['rate'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (rate != null) "rate": rate,
    };
  }

  @override
  String toString() => 'RateInfo(name: $name, rate: $rate)';

  @override
  bool operator ==(covariant DemandsGoods other) {
    if (identical(this, other)) return true;

    return other.name == name && other.rate == rate;
  }

  @override
  int get hashCode => name.hashCode ^ rate.hashCode;
}
