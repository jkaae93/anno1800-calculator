// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Populration {
  final int type;
  final String name;
  final int count;
  Populration({
    required this.type,
    required this.name,
    required this.count,
  });

  Populration copyWith({
    int? type,
    String? name,
    int? count,
  }) {
    return Populration(
      type: type ?? this.type,
      name: name ?? this.name,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'count': count,
    };
  }

  factory Populration.fromMap(Map<String, dynamic> map) {
    return Populration(
      type: map['type'] ?? 0,
      name: map['name'] ?? '',
      count: map['count'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Populration.fromJson(String source) => Populration.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Populration.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Populration(
      name: data?['name'] ?? '',
      count: data?['count'] ?? 0,
      type: data?['type'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (type != null) "type": type,
      if (count != null) "count": count,
    };
  }

  @override
  String toString() => 'Populration(type: $type, name: $name, count: $count)';

  @override
  bool operator ==(covariant Populration other) {
    if (identical(this, other)) return true;

    return other.type == type && other.name == name && other.count == count;
  }

  @override
  int get hashCode => type.hashCode ^ name.hashCode ^ count.hashCode;
}
