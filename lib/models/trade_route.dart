import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'goods.dart';

class TradeRoute {
  final String name;
  final List<Goods> products;
  final String start;
  final String end;
  final int duration;
  TradeRoute({
    required this.name,
    required this.products,
    required this.start,
    required this.end,
    required this.duration,
  });

  TradeRoute copyWith({
    String? name,
    List<Goods>? products,
    String? start,
    String? end,
    int? duration,
  }) {
    return TradeRoute(
      name: name ?? this.name,
      products: products ?? this.products,
      start: start ?? this.start,
      end: end ?? this.end,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'products': products.map((x) => x.toMap()).toList(),
      'start': start,
      'end': end,
      'duration': duration,
    };
  }

  factory TradeRoute.fromMap(Map<String, dynamic> map) {
    return TradeRoute(
      name: map['name'] ?? '',
      start: map['start'] ?? '',
      end: map['end'] ?? '',
      duration: map['duration'] ?? 0,
      products: map['products'] != null ? map['products'].map<Goods>((x) => Goods.fromMap(x)).toList() : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory TradeRoute.fromJson(String source) => TradeRoute.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TradeRoute(name: $name, products: $products, start: $start, end: $end, duration: $duration)';
  }

  @override
  bool operator ==(covariant TradeRoute other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.products, products) && other.start == start && other.end == end && other.duration == duration;
  }

  @override
  int get hashCode {
    return name.hashCode ^ products.hashCode ^ start.hashCode ^ end.hashCode ^ duration.hashCode;
  }

  factory TradeRoute.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TradeRoute(
      name: data?['name'],
      duration: data?['duration'],
      end: data?['end'],
      products: data?['name'].map((e) => Goods.fromFirestore(snapshot, options)).toList(),
      start: data?['start'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }
}
