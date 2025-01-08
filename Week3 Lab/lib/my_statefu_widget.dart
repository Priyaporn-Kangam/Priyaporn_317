import 'package:flutter/material.dart';

class MyStatefuWidget extends StatefulWidget {
  const MyStatefuWidget({super.key});

  @override
  State<MyStatefuWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyStatefuWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StatefuWidget"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter Value:",
                style: const TextStyle(fontSize: 23, color: Colors.red)),
            Text(
              "$counter",
              style: const TextStyle(fontSize: 100),
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  },
                  child: const Icon(Icons.keyboard_return),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}