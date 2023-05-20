// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clone_calculator/widgets/roundbutton.dart';
import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  double firstNumber = 0;
  double secondNumber = 0;
  String res = "0";
  String history = "";
  String operation = "";
  String displayText = "0";

  void calculate(String btnText) {
    setState(() {
      if (btnText == "AC") {
        firstNumber = 0;
        secondNumber = 0;
        res = "";
        history = "";
        operation = "";
        displayText = "0";
      } else if (btnText == "C") {
        if (displayText.isNotEmpty) {
          if (displayText.length == 1) {
            displayText = "0";
            res = "";
            operation = "";
          } else {
            if (displayText.endsWith(operation)) {
              displayText = displayText.substring(0, displayText.length - 1);
              operation = "";
            } else {
              res = res.substring(0, res.length - 1);
              displayText = displayText.substring(0, displayText.length - 1);
            }
          }
        }
      } else if (btnText == "+" ||
          btnText == "-" ||
          btnText == "x" ||
          btnText == "/") {
        firstNumber = double.parse(res);
        displayText = firstNumber.toString() + btnText;
        operation = btnText;
        res = "";
      } else if (btnText == "=") {
        if (res == "") {
          res = secondNumber.toString();
        }
        secondNumber = double.parse(res);
        if (operation == "+") {
          res = (firstNumber + secondNumber).toString();
          history = firstNumber.toString() +
              operation.toString() +
              secondNumber.toString();
        }
        if (operation == "-") {
          res = (firstNumber - secondNumber).toString();
          history = firstNumber.toString() +
              operation.toString() +
              secondNumber.toString();
        }
        if (operation == "x") {
          res = (firstNumber * secondNumber).toString();
          history = firstNumber.toString() +
              operation.toString() +
              secondNumber.toString();
        }
        if (operation == "/") {
          res = (firstNumber / secondNumber).toString();
          history = firstNumber.toString() +
              operation.toString() +
              secondNumber.toString();
        }
        history = displayText;
        displayText = res;
        firstNumber = double.parse(res);
        secondNumber = 0;
        operation = "";
        res = "";
      } else if (btnText == ".") {
        if (!res.contains(".")) {
          // if the current result doesn't already contain a decimal point
          if (res.isEmpty) {
            // if the result is empty, add a leading zero before the decimal point
            res = "0.";
            displayText += "0.";
          } else {
            // otherwise, just add the decimal point to the end of the result
            res += ".";
            displayText += ".";
          }
        }
      } else {
        if (displayText == "0") {
          displayText = btnText;
        } else {
          displayText = displayText + btnText;
        }
        res = res + btnText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        history,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 50, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        displayText,
                        style: TextStyle(fontSize: 80, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundButton(
                    btnName: "AC",
                    txtColor: Colors.black,
                    bgColor: Colors.grey,
                    callback: () {
                      calculate("AC");
                    },
                  ),
                  roundButton(
                    btnName: "+/-",
                    txtColor: Colors.black,
                    bgColor: Colors.grey,
                  ),
                  roundButton(
                    btnName: "C",
                    txtColor: Colors.black,
                    bgColor: Colors.grey,
                    callback: () {
                      calculate("C");
                    },
                  ),
                  roundButton(
                    btnName: "/",
                    txtColor: Colors.white,
                    bgColor: Colors.orange,
                    callback: () {
                      calculate("/");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundButton(
                    btnName: "7",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("7");
                    },
                  ),
                  roundButton(
                    btnName: "8",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("8");
                    },
                  ),
                  roundButton(
                    btnName: "9",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("9");
                    },
                  ),
                  roundButton(
                    btnName: "x",
                    txtColor: Colors.white,
                    bgColor: Colors.orange,
                    callback: () {
                      calculate("x");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundButton(
                    btnName: "4",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("4");
                    },
                  ),
                  roundButton(
                    btnName: "5",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("5");
                    },
                  ),
                  roundButton(
                    btnName: "6",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("6");
                    },
                  ),
                  roundButton(
                    btnName: "-",
                    txtColor: Colors.white,
                    bgColor: Colors.orange,
                    callback: () {
                      calculate("-");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundButton(
                    btnName: "1",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("1");
                    },
                  ),
                  roundButton(
                    btnName: "2",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("2");
                    },
                  ),
                  roundButton(
                    btnName: "3",
                    txtColor: Colors.white,
                    bgColor: Color.fromARGB(255, 54, 53, 53),
                    callback: () {
                      calculate("3");
                    },
                  ),
                  roundButton(
                    btnName: "+",
                    txtColor: Colors.white,
                    bgColor: Colors.orange,
                    callback: () {
                      calculate("+");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calculate("0");
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 12, 90, 12),
                      child: Center(
                        child: Text(
                          "0",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Colors.grey,
                    ),
                  ),
                  roundButton(
                    btnName: ".",
                    bgColor: Colors.grey,
                    txtColor: Colors.white,
                    callback: () {
                      calculate(".");
                    },
                  ),
                  roundButton(
                    btnName: "=",
                    bgColor: Colors.orange,
                    txtColor: Colors.white,
                    callback: () {
                      calculate("=");
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
