// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:anno_calc/utils/enums.dart';

class Production {
  final int id;
  final String name;
  final int region;
  final int quantity;
  final List<int> resource;
  Production({
    required this.id,
    required this.name,
    required this.region,
    required this.quantity,
    required this.resource,
  });

  Production copyWith({
    int? id,
    String? name,
    int? region,
    int? quantity,
    List<int>? resource,
  }) {
    return Production(
      id: id ?? this.id,
      name: name ?? this.name,
      region: region ?? this.region,
      quantity: quantity ?? this.quantity,
      resource: resource ?? this.resource,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'region': region,
      'quantity': quantity,
      'resource': resource,
    };
  }

  factory Production.fromMap(Map<String, dynamic> map) {
    return Production(
      id: map['id'] as int,
      name: map['name'] as String,
      region: map['region'] as int,
      quantity: map['quantity'] as int,
      resource: List<int>.from((map['resource'] as List<int>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Production.fromJson(String source) => Production.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Production(id: $id, name: $name, region: $region, quantity: $quantity, resource: $resource)';
  }

  @override
  bool operator ==(covariant Production other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.region == region && other.quantity == quantity && listEquals(other.resource, resource);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ region.hashCode ^ quantity.hashCode ^ resource.hashCode;
  }
}
