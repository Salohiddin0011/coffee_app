import 'package:flutter/foundation.dart';

import '../../data/models/cart.dart';

class CartController with ChangeNotifier {
  Cart _cart = Cart(id: 1, items: []);

  void addToCard({required CoffeeModel coffee, required int quantity}) {
    final isExist = _cart.items.any((element) => element.id == coffee.id);

    if (isExist) {
      final item = _cart.items.firstWhere((element) => element.id == coffee.id);
      if (quantity == 1) {
        item.quantity++;
        notifyListeners();
      } else if (quantity == -1 && item.quantity > 0) {
        item.quantity--;
        notifyListeners();
      }

      item.total = item.quantity * item.coffee.price;
      if (item.quantity == 0) {
        _cart.items.remove(item);
        notifyListeners();
      }
    } else if (quantity == 1) {
      final cartItem = CartItem(id: coffee.id, coffee: coffee);
      _cart.items.add(cartItem);
      notifyListeners();
    }

    _cart = _cart.copyWith(items: _cart.items);
    notifyListeners();
  }

  void removeCoffee(index) {
    _cart.items[index].quantity = 0;
    _cart.items.removeAt(index);
    notifyListeners();
  }

  void clearCoffee() {
    _cart.items.clear();
    notifyListeners();
  }

  Cart get cart => _cart;
}
