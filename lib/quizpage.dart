import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/resultpage.dart';

class getjson extends StatelessWidget{

  String file;
  getjson({Key key, @required this.file}) : super(key : key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/$file"),
      builder: (context,snapshot){
        var mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
            body: Center(
              child: Text(
                "$file Loading",
                ),
            ),
          );
        }
        else{
          return quizpage(mydata : mydata);
        }
    },
    );
  }
}

class quizpage extends StatefulWidget{

  var mydata;

  quizpage({Key key, @required this.mydata}) : super(key : key);

  @override
  _quizpageState createState() => _quizpageState(mydata);
}
class _quizpageState extends State<quizpage>
{

  var mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks=0;
  int i=1;
  int timer = 30;
  String showtimer = "30";
  bool canceltimer = false;

  Map<String, Color>btncolor = {
    "a" : Colors.indigoAccent,
    "b" : Colors.indigoAccent,
    "c" : Colors.indigoAccent,
    "d" : Colors.indigoAccent,
};

  @override
  void initState(){
    starttimer();
    super.initState();
  }

  void nextquestion(){
    timer = 30;
    canceltimer = false;
    setState(() {
      if(i<5)
        {
          i++;
        }
      else{
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (context) =>resultpage(marks : marks),

        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
    });
    starttimer();
  }

  void starttimer() async {
      const onesec = Duration(seconds: 1);
      Timer.periodic(onesec, (Timer t){
        setState(() {
          if(timer<1)
            {
              t.cancel();
              nextquestion();
            }
          else if(canceltimer == true)
            {
              t.cancel();
            }
          else{
            timer = timer - 1;
          }
          showtimer = timer.toString();
        });
      });
  }


  void checkanswer(String k){
   if(mydata[2][i.toString()] == mydata[1][i.toString()][k])
     {
       colortoshow = right;
       marks = marks + 1;
     }
   else
     {
       colortoshow = wrong;
     }
   setState(() {
      btncolor[k]= colortoshow;
      canceltimer = true;
   });

   Timer(Duration(seconds: 2), nextquestion);

  }

Widget choicebutton(String k) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    child: MaterialButton(
      onPressed: () => checkanswer(k),
      child: Text(
        mydata[1][i.toString()][k],
            style: TextStyle(
          color: Colors.white,
        fontFamily: "Alike",
              fontSize: 16.0,
      ),
        maxLines: 1,
      ),
      color: btncolor[k],
      splashColor: Colors.indigo[700],
      highlightColor: Colors.indigo[700],
      minWidth: 200.0,
        height: 45.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    ),
  );
}
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
            title: Text(
              "Quizstar",
            ),
              content: Text(
                "You can't Go Back at this stage",
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Ok"
                  ),
                )
              ],
        ));
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Quando",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Times New Roman",

                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
