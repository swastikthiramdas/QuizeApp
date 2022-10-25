import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizeapp/pages/resultpage.dart';

class loadjson extends StatelessWidget {

  String lang;
  loadjson(String this.lang, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(lang),
        builder: (context, snapshot) {
          List mydata = json.decode(snapshot.data.toString());
          if (mydata == null) {
            return const Center(
              child: Text("Loding..."),
            );
          } else {
            return quizepage(mydata: mydata);
          }
        },
      ),
    );
  }
}

class quizepage extends StatefulWidget {
  final mydata;
  quizepage({Key? key, @required this.mydata}) : super(key: key);

  @override
  State<quizepage> createState() => _quizepageState(mydata);
}

class _quizepageState extends State<quizepage> {
  List mydata;

  _quizepageState(this.mydata);

  int i = 1;
  int marks = 0;
  int timer = 30;
  bool canceltimer = false;
  Color coloretoshow = Colors.cyan;
  Color right = Colors.green;
  int showtimer = 30;
  Color wrong = Colors.red;
  Map<String, Color> btncolor = {
    "a": Colors.cyan,
    "b": Colors.cyan,
    "c": Colors.cyan,
    "d": Colors.cyan
  };

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted) {
      super.setState(fn);
    }
  }
  @override
  void initState() {
    starttimer();
    super.initState();
  }

  void starttimer() async {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timer == 0) {
          t.cancel();
          nextquetion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer--;
        }

        if (mounted)
          setState(() {
            showtimer = timer;
          });
      });
    });
  }

  void nextquetion() {
    canceltimer = false;
    timer = 30;
    if (mounted)
      setState(() {
        if (i < 10) {
          i++;
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => resultpage(marks: marks)));
        }

        btncolor["a"] = Colors.cyan;
        btncolor["b"] = Colors.cyan;
        btncolor["c"] = Colors.cyan;
        btncolor["d"] = Colors.cyan;
      });
    starttimer();
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      // correct answer
      marks = marks + 5;
      coloretoshow = right;
    } else {
      coloretoshow = wrong;
    }

    if (mounted)
      setState(() {
        btncolor[k] = coloretoshow;
        canceltimer = true;
        Timer(Duration(seconds: 2), nextquetion);
      });
  }

  Widget customebutton(String k) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: MaterialButton(
          onPressed: () => checkanswer(k),
          color: btncolor[k],
          minWidth: 200.0,
          height: 45.0,
          textColor: Colors.white,
          highlightColor: Colors.cyan.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Text(
            mydata[1][i.toString()][k],
            style: TextStyle(fontSize: 16.0, fontFamily: "Akila"),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    mydata[0][i.toString()],
                    style: TextStyle(fontSize: 20.0, fontFamily: "Quando"),
                  ))),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  children: [
                    customebutton("a"),
                    customebutton("b"),
                    customebutton("c"),
                    customebutton("d")
                  ],
                ),
              )),
          Expanded(
              child: Text(
            showtimer.toString(),
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
