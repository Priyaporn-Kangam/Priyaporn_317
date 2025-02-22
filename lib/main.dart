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
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteProduct(product['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            TextEditingController nameController = TextEditingController();
            TextEditingController descriptionController = TextEditingController();
            TextEditingController priceController = TextEditingController();
            return AlertDialog(
              title: Text('เพิ่มสินค้าใหม่'),
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
                  child: Text('เพิ่ม'),
                  onPressed: () {
                    addProduct(
                      nameController.text,
                      descriptionController.text,
                      double.parse(priceController.text),
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
