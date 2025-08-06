import 'package:flutter/material.dart';
import 'package:task7/Product.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Product product = routeArgs['product'] as Product;
    final Function updateProduct = routeArgs['updateProduct'];
    final Function deleteProduct = routeArgs['deleteProduct'];

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                product.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left,
                        color: Color.fromARGB(255, 0, 0, 0)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '(${product.rating})',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${product.price}",
                                  style: const TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Size:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: List.generate(
                      6,
                      (index) {
                        int size = 39 + index;
                        return ChoiceChip(
                          label: Text(size.toString()),
                          selected: size == 41,
                          onSelected: (selected) {
                            // Handle size selection
                          },
                          selectedColor: const Color.fromARGB(255, 60, 84, 252),
                          backgroundColor: Colors.grey[200],
                          showCheckmark: false,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 42.0,
                            vertical: 12.0,
                          ),
                        ),
                        onPressed: () {
                          deleteProduct(product);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'DELETE',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 60, 84, 252),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 42.0,
                            vertical: 12.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/editProduct',
                              arguments: {
                                'product': product,
                                'updateProduct': updateProduct,
                                'deleteProduct': deleteProduct
                              });
                        },
                        child: const Text(
                          'UPDATE',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
