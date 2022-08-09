import 'package:flutter/material.dart';
import 'package:live_weather_app/services/get_location_service.dart';
import 'package:http/http.dart' as http;

import 'main_screen.dart';


const String apiKey = "2180578faf061372fd5ec654dec11dd1";

class GetLocationPage extends StatefulWidget {
  const GetLocationPage({Key? key}) : super(key: key);

  @override
  State<GetLocationPage> createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
late double latitude;
late double longitude;
@override
  void initState() {
    super.initState();
  getLocation();
  }
  void getLocation()
  async{
    Location location = Location();
   await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  getData()
  async{
    http.Response response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric"));
    if(response.statusCode == 200){
    String data = response.body;
    if(!mounted) return;
    // print();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MainScreen(data)));
    }else
    {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.blue),),
    );
  }
}