import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/quizpage.dart';

class home extends StatefulWidget{
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  List<String> images = [
    "images/c.png",
    "images/c++.png",
    "images/java.png",
    "images/python.jpg",
  ];

  Widget customcard(String langname, String image, String sub) {
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        onTap: () {
          String filename =sub;
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(file: filename),
            )
          );

        },
        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(

            height: 200.0,
            width: 200.0,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Material(
                      child: Container(
                        height: 175.0,
                        width: 175.0,
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quizstar",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("C", images[0], "c.json"),
          customcard("C++", images[1],"cpp.json"),
          customcard("Java", images[2],"java.json"),
          customcard("Python", images[3], "python.json"),
        ],
      ),
    );
  }
}