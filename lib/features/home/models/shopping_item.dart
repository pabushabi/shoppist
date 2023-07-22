class ShoppingItemModel {
  String name;
  double amount;
  double maxAmount;
  String type;

  ShoppingItemModel({
    required this.name,
    required this.amount,
    required this.maxAmount,
    required this.type,
  });

  factory ShoppingItemModel.empty() => ShoppingItemModel(
        name: '',
        amount: 0,
        maxAmount: 0,
        type: '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'maxAmount': maxAmount,
        'type': type,
      };

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) =>
      ShoppingItemModel(
        name: json['name'],
        amount: double.parse('${json['amount']}'),
        maxAmount: double.parse('${json['maxAmount']}'),
        type: json['type'],
      );

  @override
  String toString() {
    return '{name: $name, amount: $amount, maxAmount: $maxAmount, type: $type}';
  }

  String get amountFormatted =>
      (amount - amount.floor() > 0) ? '$amount' : '${amount.floor()}';

  String get maxAmountFormatted => (maxAmount - maxAmount.floor() > 0)
      ? '$maxAmount'
      : '${maxAmount.floor()}';
}
