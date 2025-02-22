import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(primarySwatch: Colors.indigo),
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
            TextButton(
              child: Text('ยกเลิก', style: TextStyle(color: Colors.redAccent)),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(id == null ? 'เพิ่ม' : 'บันทึก', style: TextStyle(color: Colors.teal)),
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
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.indigo, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Product List',
            style: TextStyle(color: Colors.indigo[800], fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 4,
        backgroundColor: Colors.indigo.shade50,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.purple.shade50,
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(product['description']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${product['price'].toInt()}',
                      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blueAccent),
                      onPressed: () => showProductDialog(
                        id: product['id'],
                        name: product['name'],
                        description: product['description'],
                        price: product['price'],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => deleteProduct(product['id']),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () => showProductDialog(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
