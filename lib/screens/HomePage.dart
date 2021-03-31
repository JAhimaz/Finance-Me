import 'package:flutter/material.dart';
import 'package:finance_me/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentBalance = 1033.45;
  double _savingsGoal = 5000.00;

  void _spentExpense(double amount) {
    setState(() {
      _currentBalance -= amount;
    });
  }

  void _recievedExpense(double amount) {
    setState(() {
      _currentBalance += amount;
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
                height: height * 0.32,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: (height * 0.075), left: (height * 0.03)),
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
                            child: Text("RM$_currentBalance",
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
                            child: Text("RM$_savingsGoal",
                                style: TextStyle(
                                    color: sub_color,
                                    fontSize: height * 0.045)),
                          )),
                    ],
                  ),
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
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                print("Add Clicked");
                                _addExpenseModalBottom(context);
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

  void _addExpenseModalBottom(context) {
    double height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
        barrierColor: background_color.withOpacity(0.90),
        backgroundColor: background_color,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: height * 0.5,
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
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: height * 0.1,
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            print("Close");
                          },
                          child: Text("X",
                              style: TextStyle(
                                  color: primary_color,
                                  fontSize: height * 0.05)),
                        ),
                      )),
                ),
              ],
            ),
          );
        });
  }
}
