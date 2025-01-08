
import 'package:flutter/material.dart';
import 'answer1.dart';
import 'answer2.dart';
import 'answer3.dart';
import 'answer4.dart';



class AnswerPortal extends StatelessWidget {
  const AnswerPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Answer'),
        backgroundColor: const Color.fromARGB(255, 179, 224, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Answer1()),
                );
              },
              child: const Text('Answer 1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Answer2()),
                );
              },
              child: const Text('Answer 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Answer3()),
                );
              },
              child: const Text('Answer 3'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Answer4()),
                );
              },
              child: const Text('Answer 4'),
            ),
          ],
        ),
      ),
    );
  }
}