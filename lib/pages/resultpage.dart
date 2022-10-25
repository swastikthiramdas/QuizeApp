import 'package:flutter/material.dart';

import 'home_page.dart';

class resultpage extends StatefulWidget {

  int marks;

  resultpage({Key? key, required this.marks}) : super(key: key);

  @override
  State<resultpage> createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {

  int marks;
  _resultpageState(this.marks);

  List<String> images =[
    "images/bad.png",
    "images/good.png",
    "images/success.png"
  ];

  String image = "images/success.png";
  String message = "";

  void initState() {
    if(marks < 20){
      image = images[0];
      message = "You done very bad , try again next time\n" + "You scored $marks";
    }
    else if(marks < 35){
      image = images[1];
      message = "You can do more better\n" + "You scored $marks";
    }
    else{
      image = images[2];
      message = "You done very well\n" + "You scored $marks";
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: [
                    Material(
                      child: Container(
                          width: 400.0,
                          height: 300.0,
                          child: ClipRect(
                            child: Image(
                              image: AssetImage(image),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 15),
                      child: Center(
                          child: Text(message , style: TextStyle(fontSize: 20.0))
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
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      child: Text("CONTINUE",style: TextStyle(fontSize: 16.0 , color: Colors.black )),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
