class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class ShoppingCart {
  final Map<Product, int> _items = {};

  void addItem(Product product, [int quantity = 1]) {
    _items.update(product, (value) => value + quantity, ifAbsent: () => quantity);
  }

  void removeItem(Product product, [int quantity = 1]) {
    _items.update(product, (value) => (value - quantity).clamp(0, value));
    _items.removeWhere((key, value) => value <= 0);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    _items.forEach((product, quantity) {
      totalPrice += product.price * quantity;
    });
    return totalPrice;
  }

  double calculateDiscountedPrice() {
    double totalPrice = calculateTotalPrice();
    // Apply discounts based on the quantity and type of items
    // Example discount logic
    if (_items.length >= 3) {
      totalPrice *= 0.9; // Apply 10% discount if there are 3 or more items
    }
    return totalPrice;
  }

  void printReceipt() {
    print('Receipt:');
    _items.forEach((product, quantity) {
      print('${product.name} - ${product.price} x $quantity');
    });
    print('Total Price: \$${calculateTotalPrice()}');
    print('Discounted Price: \$${calculateDiscountedPrice()}');
  }
}

void main() {
  var apple = Product('Apple', 1.0);
  var banana = Product('Banana', 0.5);
  var orange = Product('Orange', 0.8);

  var cart = ShoppingCart();
  cart.addItem(apple, 2);
  cart.addItem(banana, 3);
  cart.addItem(orange);

  cart.printReceipt();
}
