// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:anno_calc/models/trade_route.dart';

import 'island.dart';

class UserData {
  final String name;
  final List<TradeRoute> tradeRoute;
  final List<Island> islands;
  UserData({
    this.name = '',
    required this.tradeRoute,
    required this.islands,
  });

  UserData copyWith({
    String? name,
    List<TradeRoute>? tradeRoute,
    List<Island>? islands,
  }) {
    return UserData(
      name: name ?? this.name,
      tradeRoute: tradeRoute ?? this.tradeRoute,
      islands: islands ?? this.islands,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'tradeRoute': tradeRoute.map((x) => x.toMap()).toList(),
      'islands': islands.map((x) => x.toMap()).toList(),
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] as String,
      tradeRoute: map['tradeRoute'].map<TradeRoute>((x) => TradeRoute.fromMap(x)).toList(),
      islands: map['islands'].map<Island>((x) => Island.fromMap(x)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserData(name: $name, tradeRoute: $tradeRoute, islands: $islands)';

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.tradeRoute, tradeRoute) && listEquals(other.islands, islands);
  }

  @override
  int get hashCode => name.hashCode ^ tradeRoute.hashCode ^ islands.hashCode;

  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      name: data?['name'],
      islands: data?['islands'].map((e) => Island.fromFirestore(snapshot, options)).toList(),
      tradeRoute: data?['trade_route'].map((e) => TradeRoute.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (tradeRoute != null) "tradeRoute": tradeRoute,
      if (islands != null) "islands": islands,
    };
  }
}
