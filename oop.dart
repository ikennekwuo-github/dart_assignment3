// Abstract class defining a contract for discountable items
abstract class Discountable {
  double getDiscountPercentage();
  double applyDiscount(double price);
}

// Base class encapsulating data and methods
class Product {
  // Private variables
  String _name;
  double _price;

  // Constructor
  Product(this._name, this._price);

  // Public getters
  String get name => _name;
  double get price => _price;

  // Method to display product details
  void display() {
    print("Product Name: $_name");
    print("Price: \$$price");
  }
  
  // Method to calculate price with tax (Encapsulation example)
  double priceWithTax(double taxRate) {
    return _price + (_price * taxRate);
  }
}

// Subclass inheriting from Product
class Electronics extends Product implements Discountable {
  // Constructor
  Electronics(String name, double price) : super(name, price);

  // Overridden method for specific display details
  @override
  void display() {
    super.display();
    print("Category: Electronics");
  }

  // Implementation of abstract methods from Discountable
  @override
  double getDiscountPercentage() {
    return 15.0; // 15% discount for electronics
  }

  @override
  double applyDiscount(double price) {
    double discount = getDiscountPercentage() / 100.0;
    return price * (1 - discount);
  }
}

// Subclass inheriting from Product
class Clothing extends Product implements Discountable {
  // Constructor
  Clothing(String name, double price) : super(name, price);

  // Overridden method for specific display details
  @override
  void display() {
    super.display();
    print("Category: Clothing");
  }

  // Implementation of abstract methods from Discountable
  @override
  double getDiscountPercentage() {
    return 10.0; // 10% discount for clothing
  }

  @override
  double applyDiscount(double price) {
    double discount = getDiscountPercentage() / 100.0;
    return price * (1 - discount);
  }
}

void main() {
  // Create product instances
  Product phone = Electronics("Smartphone", 599.99);
  Product shirt = Clothing("T-Shirt", 19.99);

  // Display product details
  phone.display();
  print("Price with tax (7%): \$${phone.priceWithTax(0.07).toStringAsFixed(2)}");
  print("Discounted Price: \$${(phone as Discountable).applyDiscount(phone.price).toStringAsFixed(2)}\n");

  shirt.display();
  print("Price with tax (7%): \$${shirt.priceWithTax(0.07).toStringAsFixed(2)}");
  print("Discounted Price: \$${(shirt as Discountable).applyDiscount(shirt.price).toStringAsFixed(2)}");
}