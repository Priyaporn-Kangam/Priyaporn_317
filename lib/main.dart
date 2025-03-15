import 'package:flutter/material.dart';
import 'package:my_app/page_answer/answer_portal.dart';

void main() {
  runApp(const MyApp()); // เรียกใช้แอป
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Answers App',  // ชื่อแอป
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnswerPortal(), // หน้าหลักที่จะแสดงผลคือ AnswerPortal
    );
  }
}
