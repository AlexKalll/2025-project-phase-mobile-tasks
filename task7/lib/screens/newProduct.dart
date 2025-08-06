import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task7/Product.dart';
import 'dart:io';

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Function addProduct = routeArgs['addProduct'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // set bg color to white
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Add Product',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // back
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: _image == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 50, color: Colors.grey),
                            SizedBox(height: 8.0),
                            Text(
                              'Upload Image',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      : Image.file(
                          File(_image!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text('Name'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  // labelText: 'Name',
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 238, 238, 238),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text('Category'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 231, 231, 231),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text('Price'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixText: '\$',
                  fillColor: Color.fromARGB(255, 231, 231, 231),
                  filled: true,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text('Description'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 231, 231, 231),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromARGB(255, 60, 84, 252),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                      ),
                      onPressed: () {
                        // make image required
                        if (_image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please upload an image'),
                            ),
                          );
                          return;
                        }
                        if (_formKey.currentState!.validate()) {
                          // Handle add product
                          final newProduct = Product(
                              id: DateTime.now().toString(),
                              name: _nameController.text,
                              category: _categoryController.text,
                              price: double.parse(_priceController.text),
                              description: _descriptionController.text,
                              image:
                                  'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              size: "20",
                              rating: '5');

                          addProduct(newProduct);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'ADD',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.red),
                        ),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                      ),
                      onPressed: () {
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
