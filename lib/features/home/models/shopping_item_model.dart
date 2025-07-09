import 'package:shoppist/features/home/models/tag_model.dart';

class ShoppingItemModel {
  String id;
  String name;
  double amount;
  double maxAmount;
  TagModel? tag;

  ShoppingItemModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.maxAmount,
    this.tag,
  });

  factory ShoppingItemModel.empty() => ShoppingItemModel(
        id: '',
        name: '',
        amount: 0,
        maxAmount: 0,
        tag: null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'amount': amount,
        'maxAmount': maxAmount,
        'tag': tag?.toJson(),
      };

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) =>
      ShoppingItemModel(
        id: json['id'],
        name: json['name'],
        amount: double.parse('${json['amount']}'),
        maxAmount: double.parse('${json['maxAmount']}'),
        tag: json['tag'] != null ? TagModel.fromJson(json['tag']) : null,
      );

  @override
  String toString() {
    return '{id: $id: name: $name, amount: $amount/$maxAmount, type: $tag}';
  }

  String get amountFormatted =>
      (amount - amount.floor() > 0) ? '$amount' : '${amount.floor()}';

  String get maxAmountFormatted => (maxAmount - maxAmount.floor() > 0)
      ? '$maxAmount'
      : '${maxAmount.floor()}';
}
