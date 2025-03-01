import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TrafficLightScreen(),
  ));
}

class TrafficLightScreen extends StatefulWidget {
  @override
  _TrafficLightScreenState createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  int _currentLight = 0; // 0 = Red, 1 = Yellow, 2 = Green
  int _countdown = 0; // Countdown timer in seconds
  late Timer _timer;

  void _changeLight() {
    setState(() {
      _currentLight = (_currentLight + 1) % 3;
      _startCountdown();
    });
  }

  void _startCountdown() {
    // Set the countdown based on the current light
    if (_currentLight == 0) {
      _countdown = 10; // Red light lasts for 10 seconds
    } else if (_currentLight == 1) {
      _countdown = 5; // Yellow light lasts for 5 seconds
    } else if (_currentLight == 2) {
      _countdown = 15; // Green light lasts for 15 seconds
    }

    // Start the countdown timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          // When countdown reaches 0, change to the next light
          _changeLight();
          _timer.cancel();
        }
      });
    });
  }

  double _getOpacity(int lightIndex) {
    return _currentLight == lightIndex ? 1.0 : 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Traffic Light Animation')),
        backgroundColor: const Color.fromARGB(255, 130, 153, 203),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the countdown timer above the traffic lights
            Text(
              '$_countdown', // Only show the number
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _getOpacity(0),
              child: _buildLight(Colors.red),
            ),
            SizedBox(height: 10),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _getOpacity(1),
              child: _buildLight(Colors.yellow),
            ),
            SizedBox(height: 10),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _getOpacity(2),
              child: _buildLight(Colors.green),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeLight,
              child: Text('เปลี่ยนไฟ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLight(Color color) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.5), blurRadius: 20, spreadRadius: 5),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
