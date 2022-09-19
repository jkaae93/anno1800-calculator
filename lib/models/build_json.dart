// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BuildJson {
  final int type;
  final String name;
  final int region;
  BuildJson({
    required this.type,
    required this.name,
    required this.region,
  });

  BuildJson copyWith({
    int? type,
    String? name,
    int? region,
  }) {
    return BuildJson(
      type: type ?? this.type,
      name: name ?? this.name,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'region': region,
    };
  }

  factory BuildJson.fromMap(Map<String, dynamic> map) {
    return BuildJson(
      type: map['type'] as int,
      name: map['name'] as String,
      region: map['region'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildJson.fromJson(String source) => BuildJson.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BuildJson(type: $type, name: $name, region: $region)';

  @override
  bool operator ==(covariant BuildJson other) {
    if (identical(this, other)) return true;

    return other.type == type && other.name == name && other.region == region;
  }

  @override
  int get hashCode => type.hashCode ^ name.hashCode ^ region.hashCode;
}

class BuildPopulJson {
  final int type;
  final String name;
  final int region;
  BuildPopulJson({
    required this.type,
    required this.name,
    required this.region,
  });

  BuildPopulJson copyWith({
    int? type,
    String? name,
    int? region,
  }) {
    return BuildPopulJson(
      type: type ?? this.type,
      name: name ?? this.name,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'region': region,
    };
  }

  factory BuildPopulJson.fromMap(Map<String, dynamic> map) {
    return BuildPopulJson(
      type: map['type'] as int,
      name: map['name'] as String,
      region: map['region'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildPopulJson.fromJson(String source) => BuildPopulJson.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BuildPopulJson(type: $type, name: $name, region: $region)';

  @override
  bool operator ==(covariant BuildPopulJson other) {
    if (identical(this, other)) return true;

    return other.type == type && other.name == name && other.region == region;
  }

  @override
  int get hashCode => type.hashCode ^ name.hashCode ^ region.hashCode;
}
