import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AQIPage extends StatefulWidget {
  @override
  _AQIPageState createState() => _AQIPageState();
}

class _AQIPageState extends State<AQIPage> {
  String city = "Loading...";
  int aqi = 0;
  double temperature = 0.0;
  bool isLoading = true;

  Future<void> fetchAQI() async {
    const String token = "b019b4f8f7de5eee1394bd4788a0380967bc1e36";
    const String cityName = "bangkok";
    final String url = "https://api.waqi.info/feed/$cityName/?token=$token";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          city = data['data']['city']['name'];
          aqi = data['data']['aqi'];
          temperature = data['data']['iaqi']['t']['v'];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load AQI data");
      }
    } catch (e) {
      setState(() {
        city = "Error";
        aqi = 0;
        temperature = 0.0;
        isLoading = false;
      });
    }
  }

  String getEmoji(int aqi) {
    if (aqi <= 50) return "😊 🏞️";
    if (aqi <= 100) return "😐 🌤️";
    if (aqi <= 150) return "😷 🌫️";
    if (aqi <= 200) return "🤢 🌪️";
    if (aqi <= 300) return "🤮 ☠️";
    return "💀 🏭";
  }

  @override
  void initState() {
    super.initState();
    fetchAQI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Air Quality Index (AQI)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.purple.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Colors.yellow, Colors.orangeAccent],
                      ).createShader(bounds),
                      child: Text(
                        city,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [Shadow(color: Colors.black45, blurRadius: 5)],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: aqi > 100 ? Colors.redAccent : Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 12,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "$aqi ${getEmoji(aqi)}",
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            aqi > 100 ? "Unhealthy" : "Good",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade700,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Temperature: ${temperature.toStringAsFixed(1)}°C 🌡️",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: fetchAQI,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurpleAccent,
                        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text("Refresh"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
