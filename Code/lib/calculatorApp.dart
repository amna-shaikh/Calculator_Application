import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  static TextEditingController Data = TextEditingController();
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var userinput = '';
  var output = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text(
              'Calculator App',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(right: 20, top: 20, left: 0),
                child: Text(
                  userinput,
                 // textAlign: TextAlign.start,
                  //textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 20, top: 20, left: 0),
                  child: Text(
                    output,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 30),
                  )),
              Row(
                children: [
                  myContainer(
                    buttons: 'AC',
                    func: () {
                      setState(() {
                        userinput += 'AC';
                      });
                    },
                  ),
                  myContainer(
                    buttons: '()',
                    func: () {
                      setState(() {
                        userinput += '()';
                      });
                    },
                  ),
                  myContainer(
                    buttons: '%',
                    func: () {
                      setState(() {
                        userinput += '%';
                      });
                    },
                  ),
                  myContainer(
                    buttons: '+',
                    func: () {
                      setState(() {
                        userinput += '+';
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  myContainer(
                    buttons: '7',
                    func: () {
                      setState(() {
                        userinput += '7';
                      });
                    },
                  ),
                  myContainer(
                    buttons: '8',
                    func: () {
                      setState(() {
                        userinput += '8';
                      });
                    },
                  ),
                  myContainer(
                    buttons: '9',
                    func: () {
                      setState(() {
                        userinput += '9';
                      });
                    },
                  ),
                  myContainer(
                    buttons: '-',
                    func: () {
                      setState(() {
                        userinput += '-';
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  myContainer(buttons: '6',
                    func: () {
                      setState(() {
                        userinput += '6';
                      });
                    },),
                  myContainer(buttons: '5',
                    func: () {
                      setState(() {
                        userinput += '5';
                      });
                    },),
                  myContainer(buttons: '4',
                    func: () {
                      setState(() {
                        userinput += '4';
                      });
                    },),
                  myContainer(
                    buttons: '*',
                    func: () {
                      setState(() {
                        userinput += '*';
                      });
                    },
                  ),
                //  myContainer(buttons: 'clr'),
                ],
              ),
              Row(
                children: [
                  myContainer(buttons: '3',
                      func: () {
                        setState(() {
                          userinput += '3';
                        });
                      }),
                  myContainer(buttons: '2',
                      func: () {
                        setState(() {
                          userinput += '2';
                        });
                      }),
                  myContainer(buttons: '1',
                      func: () {
                        setState(() {
                          userinput += '1';
                        });
                      }),
                  myContainer(
                    buttons: '/',
                    func: () {
                      setState(() {
                        userinput += '/';
                      });},
                  ),
                ],
              ),
              Row(
                children: [
                  myContainer(buttons: '.',
                    func: () {
                      setState(() {
                        userinput += '.';
                      });
                    },),
                  myContainer(buttons: '0' ,
                    func: () {
                      setState(() {
                        userinput += '0';
                      });
                    },),
                  myContainer(buttons: 'C',
                    func: () {
                      setState(() {
                        userinput = '0';
                        output = '0';

                      });
                    },),
                  myContainer(buttons: '=', func: calculate)
                ],),

            ]),

          )),
    );
  }

  void calculate() {
    setState(() {
      String UserOutput = userinput;
      UserOutput = userinput.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(UserOutput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      output = eval.toString();
      print(output);
    });
  }
}

class myContainer extends StatelessWidget {
  final String buttons;
  final func;

  myContainer({required this.buttons, this.func});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: func,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    color: Colors.white70,
                    child: Text(
                      buttons,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )))));
  }
}
