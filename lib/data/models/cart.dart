class CoffeeModel {
  final int id;
  final String image;
  final String title;
  final String description;
  final double price;
  final String category;
  const CoffeeModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.id});
}

class CartItem {
  final int id;
  int quantity;
  double total;
  final CoffeeModel coffee;

  CartItem({
    required this.id,
    this.quantity = 1,
    required this.coffee,
  }) : total = quantity * coffee.price;

  @override
  String toString() {
    return "CartItem{$coffee - $quantity}; ";
  }

  CartItem copyWith({
    int? id,
    int? quantity,
    CoffeeModel? coffee,
  }) {
    return CartItem(
        id: id ?? this.id,
        coffee: coffee ?? this.coffee,
        quantity: quantity ?? this.quantity);
  }
}

class Cart {
  final int id;
  List<CartItem> items;
  double total;

  Cart({required this.id, required this.items})
      : total = items.fold<double>(
            0.0, (previousValue, element) => previousValue + element.total);

  Cart copyWith({int? id, List<CartItem>? items}) {
    return Cart(id: id ?? this.id, items: items ?? this.items);
  }

  @override
  String toString() {
    return "Cart{total: $total, items: $items}";
  }
}
