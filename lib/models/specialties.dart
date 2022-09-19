// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Specialties {
  final int type;
  final String name;
  final int quantity;
  final int id;

  Specialties({
    required this.type,
    required this.name,
    required this.quantity,
    required this.id,
  });

  Specialties copyWith({
    int? type,
    String? name,
    int? quantity,
    int? id,
  }) {
    return Specialties(
      type: type ?? this.type,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'quantity': quantity,
      'id': id,
    };
  }

  factory Specialties.fromMap(Map<String, dynamic> map) {
    return Specialties(
      type: map['type'] as int,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Specialties.fromJson(String source) => Specialties.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Specialties(type: $type, name: $name, quantity: $quantity, id: $id)';
  }

  @override
  bool operator ==(covariant Specialties other) {
    if (identical(this, other)) return true;

    return other.type == type && other.name == name && other.quantity == quantity && other.id == id;
  }

  @override
  int get hashCode {
    return type.hashCode ^ name.hashCode ^ quantity.hashCode ^ id.hashCode;
  }
}
