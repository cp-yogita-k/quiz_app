import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() => runApp(QuizApp());

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  List question = [
    "The human skin regenerates once in two weeks. ", //false
    "The average human body consists of 60% water.", //true
    "The human brain contains the maximum amount of muscle density.", //false
    "The first movie produced by Pixar was “Toy Story” ", //true
    "Satyajit Rey is known as the father of Indian Cinema.", //false
    "Facebook has been losing users in the past years. ", //false
    "It takes two weeks for a sloth to digest a single meal. ", //true
    "On the moon, an astronaut once played golf.", //true
    "There are five Oceans in the world " //true
  ];
  int questionNumber = 0;
  List answer = [false, true, false, true, false, false, true, true, true];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
          body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                question[questionNumber],
                style: TextStyle(fontSize: 30,color: Colors.white),
              ),
            ))),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    bool correctAnswer= answer[questionNumber];
                    setState(() {
                      if(correctAnswer==true)
                      questionNumber++;
                      else{
                        Fluttertoast.showToast(
                            msg: "Wrong Answer",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    });
                  },
                  child: Text("True"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                      textStyle: MaterialStatePropertyAll(TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      )),
                      fixedSize: MaterialStatePropertyAll(Size(1000, 70)))),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  bool correctAnswer= answer[questionNumber];
                  setState(() {
                    if(correctAnswer==false)
                    questionNumber++;
                    else{
                      Fluttertoast.showToast(
                          msg: "Wrong Answer",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  });
                },
                child: Text("False"),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                    fixedSize: MaterialStatePropertyAll(Size(1000, 70))),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      )),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: QuizPage(),
      ),
    );
  }
}
