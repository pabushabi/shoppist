import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TagModel extends Equatable {
  final String name;
  final Color color;

  const TagModel({
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'color': '$color'.split('0x')[1].replaceAll(')', ''),
      };

  factory TagModel.fromJson(Map<String, dynamic> json) => TagModel(
        name: json['name'],
        color: Color(int.parse(json['color'], radix: 16)),
      );

  @override
  List<Object?> get props => [name, color];
}
