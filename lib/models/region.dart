import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegionModel {
  final String name;
  final int id;
  RegionModel({
    required this.name,
    required this.id,
  });

  RegionModel copyWith({
    String? name,
    int? id,
  }) {
    return RegionModel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory RegionModel.fromMap(Map<String, dynamic> map) {
    return RegionModel(
      name: map['name'] ?? '',
      id: map['id'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegionModel.fromJson(String source) => RegionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory RegionModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return RegionModel(
      name: data?['name'] ?? '',
      id: data?['id'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (id != null) "id": id,
    };
  }

  @override
  String toString() => 'RegionModel(name: $name, id: $id)';

  @override
  bool operator ==(covariant RegionModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
