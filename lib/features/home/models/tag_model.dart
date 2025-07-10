import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TagModel extends Equatable {
  final String name;
  final Color color;

  const TagModel({
    required this.name,
    required this.color,
  });

  String get hex => '0x${color.toARGB32().toRadixString(16).padLeft(8, '0')}';

  MaterialColor get materialColor =>
      Colors.primaries.firstWhere((color) => color.shade500 == this.color);
  Map<String, dynamic> toJson() => {
        'name': name,
        'color': hex.replaceAll(RegExp(r'0x|[^a-fA-F0-9]'), ''),
      };

  factory TagModel.fromJson(Map<String, dynamic> json) => TagModel(
        name: json['name'],
        color: Color(int.parse(json['color'], radix: 16)),
      );

  @override
  List<Object?> get props => [name, color];
}
