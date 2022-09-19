import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Goods {
  final String name;
  final int region;
  final int type;
  int quantity;
  Goods({
    required this.name,
    required this.region,
    required this.type,
    this.quantity = 0,
  });

  Goods copyWith({
    String? name,
    int? region,
    int? type,
    int? quantity,
  }) {
    return Goods(
      name: name ?? this.name,
      region: region ?? this.region,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'region': region,
      'type': type,
      'quantity': quantity,
    };
  }

  factory Goods.fromMap(Map<String, dynamic> map) {
    return Goods(
      name: map['name'] ?? '',
      region: map['region'] ?? 0,
      type: map['type'] ?? 0,
      quantity: map['quantity'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Goods.fromJson(String source) => Goods.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Goods(name: $name, region: $region, type: $type, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant Goods other) {
    if (identical(this, other)) return true;

    return other.name == name && other.region == region && other.type == type && other.quantity == quantity;
  }

  @override
  int get hashCode {
    return name.hashCode ^ region.hashCode ^ type.hashCode ^ quantity.hashCode;
  }

  factory Goods.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Goods(
      name: data?['name'] ?? '',
      region: data?['region'] ?? 0,
      type: data?['type'] ?? 0,
      quantity: data?['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (region != null) "region": region,
      if (type != null) "type": type,
    };
  }
}
