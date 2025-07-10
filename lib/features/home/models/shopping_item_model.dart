import 'package:equatable/equatable.dart';
import 'package:shoppist/features/home/models/tag_model.dart';

class ShoppingItemModel extends Equatable {
  final String id;
  final String name;
  final String? description;
  final double amount;
  final double maxAmount;
  final TagModel? tag;

  const ShoppingItemModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.maxAmount,
    this.description,
    this.tag,
  });

  factory ShoppingItemModel.empty() => const ShoppingItemModel(
        id: '',
        name: '',
        amount: 0,
        maxAmount: 0,
        description: null,
        tag: null,
      );

  ShoppingItemModel copyWith({
    String? id,
    String? name,
    String? description,
    double? amount,
    double? maxAmount,
    TagModel? tag,
  }) =>
      ShoppingItemModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        maxAmount: maxAmount ?? this.maxAmount,
        tag: tag ?? this.tag,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'amount': amount,
        'maxAmount': maxAmount,
        'tag': tag?.toJson(),
      };

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) =>
      ShoppingItemModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        amount: double.parse('${json['amount']}'),
        maxAmount: double.parse('${json['maxAmount']}'),
        tag: json['tag'] != null ? TagModel.fromJson(json['tag']) : null,
      );

  @override
  String toString() {
    return '{id: $id: name: $name, desc: $description, amount: $amount/$maxAmount, type: $tag}';
  }

  String get amountFormatted =>
      (amount - amount.floor() > 0) ? '$amount' : '${amount.floor()}';

  String get maxAmountFormatted => (maxAmount - maxAmount.floor() > 0)
      ? '$maxAmount'
      : '${maxAmount.floor()}';

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        amount,
        maxAmount,
        tag,
      ];
}
