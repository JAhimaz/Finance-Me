import 'package:flutter/material.dart';
import 'package:finance_me/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPushupCounter = 0;

  void _incrementPushups() {
    setState(() {
      _currentPushupCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: background_color,
        body: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                    top: (height * 0.075), left: (height * 0.03)),
                height: height * 0.25,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text("Current Savings",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: plain_text_color,
                                  fontSize: height * 0.028)),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(bottom: (height * 0.0025)),
                          child: Text("RM1,033.40",
                              style: TextStyle(
                                  color: primary_color,
                                  fontSize: height * 0.075)),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text("Savings Goal",
                              style: TextStyle(
                                  color: sub_color, fontSize: height * 0.02)),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text("RM5,000.00",
                              style: TextStyle(
                                  color: sub_color, fontSize: height * 0.045)),
                        )),
                  ],
                )),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: background_color,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, -5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: height * 0.03),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Recent Expenditure",
                                  style: TextStyle(
                                      color: plain_text_color,
                                      fontSize: height * 0.028)),
                            ),
                          ),
                        ),
                        Container(
                            width: height * 0.1,
                            child: TextButton(
                              onPressed: () {
                                print("Add Clicked");
                              },
                              child: Text("+",
                                  style: TextStyle(
                                      color: primary_color,
                                      fontSize: height * 0.075)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
