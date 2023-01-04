// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AttributeModel {
  String name;
  String type;
  AttributeModel({
    required this.name,
    required this.type,
  });

  AttributeModel copyWith({
    String? name,
    String? type,
  }) {
    return AttributeModel(
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
    };
  }

  factory AttributeModel.fromMap(Map<String, dynamic> map) {
    return AttributeModel(
      name: map['name'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttributeModel.fromJson(String source) =>
      AttributeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AttributeModel(name: $name, type: $type)';

  @override
  bool operator ==(covariant AttributeModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.type == type;
  }

  @override
  int get hashCode => name.hashCode ^ type.hashCode;
}
