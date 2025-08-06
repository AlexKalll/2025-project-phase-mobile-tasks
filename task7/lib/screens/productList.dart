import 'package:flutter/material.dart';
import 'package:task7/Product.dart';
import 'package:task7/widgets/productCard.dart';

class ProductList extends StatefulWidget {
  ProductList({super.key});

  List<Product> products = [
    Product(
        id: "0",
        name: 'Derby Leather Headphones',
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
        price: 120.0,
        image:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        size: '7',
        rating: '4.0',
        category: "Headphones"),
    Product(
        id: "1",
        name: 'Derby Leather Headphones',
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
        price: 20.0,
        image:
            'https://images.unsplash.com/photo-1516972238977-89271fb2bab8?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        size: '7',
        rating: '2.0',
        category: "Headphones"),
    Product(
        id: "2",
        name: 'Derby Leather Headphones',
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
        price: 140.0,
        image:
            'https://images.unsplash.com/photo-1583360173899-b3124bc238d9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        size: '7',
        rating: '2.0',
        category: "Headphones")
  ];
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  void updateProduct(Product product) {
    // find product index
    setState(() {
      final productIndex =
          widget.products.indexWhere((p) => p.id == product.id);
      // update product
      widget.products[productIndex].category = product.category;
      widget.products[productIndex].description = product.description;
      widget.products[productIndex].image = product.image;
      widget.products[productIndex].name = product.name;
      widget.products[productIndex].price = product.price;
      widget.products[productIndex].rating = product.rating;
      widget.products[productIndex].size = product.size;

      print("Product updated" + product.price.toString() + "/" + product.id);
    });
  }

  void deleteProduct(Product product) {
    setState(() {
      // find product index
      final productIndex =
          widget.products.indexWhere((p) => p.id == product.id);
      // delete product
      widget.products.removeAt(productIndex);
    });
  }

  void addProduct(Product product) {
    setState(() {
      widget.products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ...widget.products
                    .map((product) => ProductCard(
                          product: product,
                          deleteProduct: deleteProduct,
                          updateProduct: updateProduct,
                        ))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color.fromARGB(255, 60, 84, 252),
        onPressed: () {
          Navigator.pushNamed(context, '/newProduct', arguments: {
            'addProduct': addProduct,
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color.fromARGB(255, 248, 248, 248),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // add cirular image
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'July 14, 2023',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        children: [
                          Text(
                            'Hello, ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'Yohannes',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromARGB(255, 194, 194, 194)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
