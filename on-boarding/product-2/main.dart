import 'dart:io';

class Product {
  String _name;
  String _description;
  double _price;

  Product(this._name, this._description, this._price);

  String get name => _name;
  String get description => _description;
  double get price => _price;

  set name(String value) => _name = value;
  set description(String value) => _description = value;
  set price(double value) => _price = value;

  void display(int index) {
    print('[$index] $_name - $_description - \$${_price.toStringAsFixed(2)}');
  }
}

class ProductManager {
  final List<Product> _products = [];

  void addProduct() {
    stdout.write("Enter product name: ");
    String name = stdin.readLineSync() ?? '';

    stdout.write("Enter product description: ");
    String desc = stdin.readLineSync() ?? '';

    stdout.write("Enter product price: ");
    double? price = double.tryParse(stdin.readLineSync() ?? '');

    if (price == null) {
      print(" Invalid price. Try again.");
      return;
    }

    _products.add(Product(name, desc, price));
    print(" Product added.");
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print(" No products found.");
      return;
    }

    for (int i = 0; i < _products.length; i++) {
      _products[i].display(i);
    }
  }

  void viewProduct() {
    stdout.write("Enter product index: ");
    int? index = int.tryParse(stdin.readLineSync() ?? '');

    if (index == null || index < 0 || index >= _products.length) {
      print(" Invalid index.");
      return;
    }

    _products[index].display(index);
  }

  void editProduct() {
    stdout.write("Enter product index to edit: ");
    int? index = int.tryParse(stdin.readLineSync() ?? '');

    if (index == null || index < 0 || index >= _products.length) {
      print(" Invalid index.");
      return;
    }

    Product p = _products[index];

    stdout.write("Enter new name (${p.name}): ");
    String name = stdin.readLineSync() ?? p.name;

    stdout.write("Enter new description (${p.description}): ");
    String desc = stdin.readLineSync() ?? p.description;

    stdout.write("Enter new price (\$${p.price}): ");
    double? price = double.tryParse(stdin.readLineSync() ?? '');

    if (price == null) {
      print(" Invalid price.");
      return;
    }

    p.name = name;
    p.description = desc;
    p.price = price;

    print(" Product updated.");
  }

  void deleteProduct() {
    stdout.write("Enter product index to delete: ");
    int? index = int.tryParse(stdin.readLineSync() ?? '');

    if (index == null || index < 0 || index >= _products.length) {
      print(" Invalid index.");
      return;
    }

    _products.removeAt(index);
    print(" Product deleted.");
  }
}

void main() {
  final manager = ProductManager();
  while (true) {
    print("\n==== eCommerce Product Manager ====");
    print("[1] Add Product");
    print("[2] View All Products");
    print("[3] View Single Product");
    print("[4] Edit Product");
    print("[5] Delete Product");
    print("[0] Exit");
    stdout.write("Choose an option: ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        manager.addProduct();
        break;
      case '2':
        manager.viewAllProducts();
        break;
      case '3':
        manager.viewProduct();
        break;
      case '4':
        manager.editProduct();
        break;
      case '5':
        manager.deleteProduct();
        break;
      case '0':
        print("Exiting...");
        return;
      default:
        print("Invalid option. Try again.");
    }
  }
}
