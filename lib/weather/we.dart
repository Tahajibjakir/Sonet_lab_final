import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Rafiul Weather App',
                style: TextStyle(
                    fontSize: 20, color: Colors.white), // Updated title style
              ),
              Icon(
                Icons.wb_sunny, // Added sun icon to the title
                color: Colors.yellow,
              ),
            ],
          ),
          backgroundColor: Colors.black, // Updated app bar background color
        ),
        body: WeatherPage(),
        backgroundColor: Colors.black, // Updated background color
      ),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String apiKey = '55259135f9589fbf8644defce5df9ef0';
  String location = 'Dhaka';
  double temperature = 0.0;
  String description = '';
  IconData weatherIcon = Icons.cloud;
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    locationController.text = location;
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blueGrey[900], // Updated container background color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: locationController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter Location',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.all(10),
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                location = locationController.text;
              });
              getWeatherData();
            },
            child: Text('Get Weather', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Updated button color
            ),
          ),
          SizedBox(height: 16),
          Icon(
            weatherIcon,
            size: 100,
            color: Colors.white,
          ),
          Text(
            'Temperature: ${temperature.toStringAsFixed(2)}°C',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'Description: $description',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }

  void getWeatherData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          temperature = data['main']['temp'] - 273.15;
          description = data['weather'][0]['description'];
          weatherIcon = _getWeatherIcon(data['weather'][0]['id']);
        });
      } else {
        setState(() {
          temperature = 0.0;
          description = 'Error fetching data';
          weatherIcon = Icons.cloud;
        });
      }
    } catch (error) {
      setState(() {
        temperature = 0.0;
        description = 'Network error';
        weatherIcon = Icons.cloud;
      });
    }
  }

  IconData _getWeatherIcon(int conditionCode) {
    if (conditionCode >= 200 && conditionCode < 300) {
      return Icons.flash_on;
    } else if (conditionCode >= 300 && conditionCode < 600) {
      return Icons.umbrella;
    } else if (conditionCode >= 600 && conditionCode < 700) {
      return Icons.ac_unit;
    } else if (conditionCode == 800) {
      return Icons.wb_sunny;
    } else {
      return Icons.cloud;
    }
  }
}
