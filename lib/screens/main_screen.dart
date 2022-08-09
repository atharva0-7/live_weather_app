import 'package:flutter/material.dart';
import 'dart:convert';

class MainScreen extends StatelessWidget {
  final String data;
  MainScreen(this.data);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:const Text("Weather")),
      body: Column(children: [
        Text("City ${jsonDecode(data)["name"]}"),
        Text("Temperature ${jsonDecode(data)["main"]["temp"].toString()}")
      ]),
    );
  }
}