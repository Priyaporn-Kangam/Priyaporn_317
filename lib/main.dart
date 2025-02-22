import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List products = [];

  void deleteProduct(int id) {
    setState(() {
      products.removeWhere((product) => product['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ลบสินค้าเรียบร้อย')));
  }

  void addProduct(String name, String description, double price) {
    setState(() {
      products.add({
        'id': products.length + 1,
        'name': name,
        'description': description,
        'price': price,
      });
    });
  }

  void editProduct(int id, String name, String description, double price) {
    setState(() {
      final index = products.indexWhere((product) => product['id'] == id);
      if (index != -1) {
        products[index] = {
          'id': id,
          'name': name,
          'description': description,
          'price': price,
        };
      }
    });
  }

  void showProductDialog({int? id, String? name, String? description, double? price}) {
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController descriptionController = TextEditingController(text: description);
    TextEditingController priceController = TextEditingController(text: price?.toString());
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(id == null ? 'เพิ่มสินค้าใหม่' : 'แก้ไขสินค้า'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: 'ชื่อสินค้า')),
              TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'รายละเอียด')),
              TextField(controller: priceController, decoration: InputDecoration(labelText: 'ราคา'), keyboardType: TextInputType.number),
            ],
          ),
          actions: [
            TextButton(child: Text('ยกเลิก'), onPressed: () => Navigator.pop(context)),
            TextButton(
              child: Text(id == null ? 'เพิ่ม' : 'บันทึก'),
              onPressed: () {
                if (nameController.text.isNotEmpty && descriptionController.text.isNotEmpty && priceController.text.isNotEmpty) {
                  if (id == null) {
                    addProduct(
                      nameController.text,
                      descriptionController.text,
                      double.parse(priceController.text),
                    );
                  } else {
                    editProduct(
                      id,
                      nameController.text,
                      descriptionController.text,
                      double.parse(priceController.text),
                    );
                  }
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text(product['description']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${product['price'].toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.green),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => showProductDialog(
                    id: product['id'],
                    name: product['name'],
                    description: product['description'],
                    price: product['price'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteProduct(product['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showProductDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
