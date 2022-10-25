import 'package:flutter/material.dart';
import 'package:quizeapp/pages/quizepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> language = ["Python","Java","JavaScript","C++","Linux"];
  List<String> langPhoto = ["images/py.png","images/java.png","images/js.png","images/cpp.png","images/linux.png"];
  List<String> Des = ["Python is a programming language","Java is a programming language","JavaScript is a programming language","C++ is a programming language","Linux is a Operating System"];

  movertoquize(BuildContext context , lang){
    String asset = " ";
    if (lang == "Python")
      asset = "assets/python.json";
    else if (lang == "Java")
      asset = "assets/java.json";
    else if(lang == "JavaScript")
      asset = "assets/js.json";
    else if(lang == "C++")
      asset = "assets/cpp.json";
    else
      asset = "assets/linux.json";

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => loadjson(asset)));
  }


  Widget customecardview(int Index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: InkWell(
        onTap: (){
          String lang = language[Index];
          movertoquize(context, lang);
        },
        child: Material(
          borderRadius: BorderRadius.circular(25.0),
          elevation: 10.0,
          color: Colors.cyan,
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(langPhoto[Index]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(language[Index],
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(Des[Index],style: TextStyle(fontSize: 18,color: Colors.white),maxLines: 5),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quize App"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          customecardview(0),
          customecardview(1),
          customecardview(2),
          customecardview(3),
          customecardview(4)
        ],
      )
    );
  }
}
