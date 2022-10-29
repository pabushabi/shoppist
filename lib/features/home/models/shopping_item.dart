class ShoppingItemModel {
  String name;
  int amount;
  int maxAmount;
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

  @override
  String toString() {
    return '{name: $name, amount: $amount, maxAmount: $maxAmount, type: $type}';
  }
}
