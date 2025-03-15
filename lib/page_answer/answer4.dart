import 'package:flutter/material.dart';

class Answer4 extends StatelessWidget {
  const Answer4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรไฟล์ผู้ใช้"), // ชื่อของแอปบาร์
        backgroundColor: Colors.orange, // สีพื้นหลังของแอปบาร์
        centerTitle: true, // จัดตำแหน่งชื่อให้อยู่ตรงกลาง
      ),
      body: Column(
        children: [
          // ส่วนหัวโปรไฟล์
          Container(
            color: const Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังของส่วนหัว
            width: double.infinity, // ขยายให้เต็มหน้าจอ
            padding: const EdgeInsets.all(20), // ระยะห่างภายใน
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40, // ขนาดของรูปโปรไฟล์
                  backgroundColor: Colors.white, // สีพื้นหลังของรูปโปรไฟล์
                ),
                SizedBox(height: 10), // ระยะห่างระหว่างรูปภาพกับชื่อ
                Text(
                  "Priyaporn Kangam", // ชื่อโปรไฟล์
                  style: TextStyle(
                    color: Colors.white, // สีตัวอักษร
                    fontSize: 18, // ขนาดตัวอักษร
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // ระยะห่างระหว่างส่วนหัวกับข้อมูล
          // ส่วนข้อมูลโปรไฟล์
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // ระยะขอบด้านข้าง
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.settings, color: Colors.blue), // ไอคอนอีเมล
                    SizedBox(width: 10),
                    Text("การตั้งค่า"), // ข้อมูลอีเมล
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.key, color: Colors.blue), // ไอคอนโทรศัพท์
                    SizedBox(width: 10),
                    Text("เปลี่ยนรหัสผ่าน"), // ข้อมูลเบอร์โทรศัพท์
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.private_connectivity, color: Colors.blue), // ไอคอนที่อยู่
                    SizedBox(width: 10),
                    Text("ความเป็นส่วนตัว"), // ข้อมูลที่อยู่
                  ],
                ),
              ],
            ),
          ),
          const Spacer(), // เว้นช่องว่างเพื่อให้ปุ่มไปอยู่ด้านล่างสุด
          // ส่วนปุ่มกด (แก้ไขโปรไฟล์, ออกจากระบบ)
          Padding(
            padding: const EdgeInsets.all(20), // ระยะขอบรอบปุ่ม
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // จัดปุ่มให้ห่างกัน
              children: [
                ElevatedButton(
                  onPressed: () {}, // ปุ่มแก้ไขโปรไฟล์
                  child: const Text("แก้ไขโปรไฟล์"),
                ),
                ElevatedButton(
                  onPressed: () {}, // ปุ่มออกจากระบบ
                  child: const Text("ออกจากระบบ"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
