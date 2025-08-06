import 'package:flutter/material.dart';
import 'package:task7/screens/productList.dart';
import 'package:task7/screens/newProduct.dart';
import 'package:task7/screens/editProduct.dart';
import 'package:task7/screens/productDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductList(), // home screen
        '/new-product': (context) => NewProduct(), 
        '/edit-product': (context) => EditProduct(),
        '/product-detail': (context) => ProductDetail(),
      },
    );
  }
}
