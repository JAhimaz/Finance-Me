import 'package:flutter/material.dart';
import 'package:finance_me/constants.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentBalance = 1033.45;
  double _savingsGoal = 5000.00;

  final reason = TextEditingController();
  final value = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    reason.dispose();
    value.dispose();
    super.dispose();
  }

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
                                _addExpenseModalBottom(context);
                                value.clear();
                                reason.clear();
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
            height: height * 0.6,
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
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.025, left: 0.03),
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
                              Navigator.of(context).pop();
                            },
                            child: Text("X",
                                style: TextStyle(
                                    color: primary_color,
                                    fontSize: height * 0.05)),
                          ),
                        )),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: height * 0.03, right: height * 0.03),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: height * 0.03),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: height * 0.015),
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: height * 0.02),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Recent Expenditure",
                                              style: TextStyle(
                                                  color: secondary_color,
                                                  fontSize: height * 0.028)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Divider(
                                      color: secondary_color,
                                    ))
                                  ],
                                ),
                              ),
                              TextField(
                                controller: reason,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    color: plain_text_color,
                                    fontSize: height * 0.03,
                                    height: 1),
                                decoration: InputDecoration(
                                  hintText: "Food",
                                  hintStyle: TextStyle(
                                      color: sub_color,
                                      fontSize: height * 0.03),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: primary_color, width: 1.5)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: height * 0.015),
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: height * 0.02),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Amount",
                                          style: TextStyle(
                                              color: secondary_color,
                                              fontSize: height * 0.028)),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    color: secondary_color,
                                  ))
                                ],
                              ),
                            ),
                            TextField(
                              controller: value,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: [
                                // FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                  color: plain_text_color,
                                  fontSize: height * 0.04,
                                  height: 1),
                              decoration: InputDecoration(
                                isDense: true,
                                prefixIcon: Container(
                                  margin: EdgeInsets.only(
                                      left: height * 0.02,
                                      right: height * 0.01),
                                  child: Text(
                                    "MYR",
                                    style: TextStyle(
                                        color: primary_color,
                                        fontSize: height * 0.03),
                                  ),
                                ),
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 0, minHeight: 0),
                                hintText: "100.00",
                                hintStyle: TextStyle(
                                    color: sub_color, fontSize: height * 0.03),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: primary_color, width: 1.5)),
                              ),
                            ),
                          ],
                        ),
                        Row(children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(
                                top: height * 0.01, bottom: height * 0.01),
                            child: Divider(
                              color: secondary_color,
                            ),
                          )),
                        ]),
                        Row(children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                height: height * 0.08,
                                margin: EdgeInsets.only(right: height * 0.02),
                                child: ElevatedButton(
                                    onPressed: () {
                                      _spentExpense(double.parse(value.text));
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: negative_color,
                                      onPrimary: negative_color,
                                      onSurface: negative_color,
                                    ),
                                    child: Text(
                                      'Spent',
                                      style: TextStyle(
                                          color: background_color,
                                          fontSize: height * 0.025),
                                    )),
                              )),
                          Expanded(
                              flex: 5,
                              child: Container(
                                height: height * 0.08,
                                margin: EdgeInsets.only(left: height * 0.02),
                                child: ElevatedButton(
                                    onPressed: () {
                                      _recievedExpense(
                                          double.parse(value.text));
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: primary_color,
                                      onPrimary: primary_color,
                                      onSurface: primary_color,
                                    ),
                                    child: Text(
                                      'Recieved',
                                      style: TextStyle(
                                          color: background_color,
                                          fontSize: height * 0.025),
                                    )),
                              )),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
