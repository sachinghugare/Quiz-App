import 'package:flutter/material.dart';
import 'package:quizapp/home.dart';
import 'package:quizapp/quizpage.dart';
class resultpage extends StatefulWidget{
  int marks;
  resultpage({Key key, @required this.marks}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage>{
  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result"
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              "images/good.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(

                        child: Text(
                          "\n    Congrulations ! \n\n You Scored $marks marks",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Quando",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed : (){

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context)  => home(),
                    ));

                  },
                  child: Text(
                    "continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ) ,
                  borderSide: BorderSide(width: 3.0, color: Colors.indigoAccent),
                  splashColor: Colors.indigoAccent,

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}