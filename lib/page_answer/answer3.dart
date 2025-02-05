import 'package:flutter/material.dart';

class Answer3 extends StatelessWidget {
  const Answer3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Product Layout"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // กลับไปหน้า main
            },
          ),
        ),
        body: const ProductPage(),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220,
            height: 50,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                  255, 213, 210, 210), // สีพื้นหลังที่ต้องการ
              borderRadius: BorderRadius.circular(8), // รูปทรงมุมโค้ง
            ),
            child: const Text(
              "Category: Electronics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // สีของข้อความ
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                ProductDetail(
                  imgPath: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pcworld.com%2Farticle%2F436674%2Fthe-best-pc-laptops-of-the-year.html&psig=AOvVaw3STYv4mim-OAQTNQ8M-yLj&ust=1736417538607000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKDv2tnx5YoDFQAAAAAdAAAAABAE",  
                  name: "Laptop",
                  price: "999 THB",
                ),
                ProductDetail(
                  imgPath: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.jib.co.th%2Fweb%2Fproduct%2FreadProduct%2F28344%2FSMARTPHONE--%25E0%25B8%25AA%25E0%25B8%25A1%25E0%25B8%25B2%25E0%25B8%25A3%25E0%25B9%258C%25E0%25B8%2597%25E0%25B9%2582%25E0%25B8%259F%25E0%25B8%2599--APPLE-IPHONE-X-256GB---SILVER--&psig=AOvVaw1P4c3SWclLYafl4vWIPBXV&ust=1736417645425000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKC0yYHy5YoDFQAAAAAdAAAAABAE", 
                  name: "Smartphone",
                  price: "899 THB",
                ),
                ProductDetail(
                  imgPath: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ubuy.co.th%2Fth%2Fproduct%2FBVP27RDD4-tablet-10-inch-android-11-tablet-pc-64gb-rom-1tb-expand-ips-hd-touch-screen-and-dual-speaker-6000mah-long-life-battery-google-certificated-wifi&psig=AOvVaw2NwvvKNkAmq-J_SVajt4J9&ust=1736417692993000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLiRnJPy5YoDFQAAAAAdAAAAABAJ",  
                  name: "Tablet",
                  price: "499 THB",
                ),
                ProductDetail(
                  imgPath: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ec-mall.com%2Fproduct%2Fdigital-camera%2Fnikon%2F190455.html&psig=AOvVaw1aj-P324YxMICcD2FblU1D&ust=1736417749225000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPikhq3y5YoDFQAAAAAdAAAAABAJ",  
                  name: "Camera",
                  price: "299 THB",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final String imgPath;
  final String name;
  final String price;

  const ProductDetail({
    super.key,
    required this.imgPath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              imgPath,  
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            price,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
