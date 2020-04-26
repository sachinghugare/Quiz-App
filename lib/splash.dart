import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/home.dart';

class splash extends StatefulWidget {
  @override
  _splash createState() => _splash();
}

class _splash extends State<splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => home(),
      ));
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.indigo,
      body : Center(
      child: Text(
      "Quizstar",
      style: TextStyle(
      fontSize: 50.0,
        color : Colors.white,
    ),
      ),
     ),
    );
  }
}