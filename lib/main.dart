import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(MaterialApp(
      // theme: ThemeData(
      //   textTheme: TextTheme(

      //     title: TextStyle(fontFamily: "century", color: Colors.white),
      //     body1: TextStyle(fontFamily: "century", color: Colors.white),
      //   ),
      // ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double height1 = 80;
  double height2 = 80;
  double height3 = 80;

  double width = double.infinity;

  double maxCircular1 = 80;
  double maxCircular2 = 80;
  double maxCircular3 = 80;

  bool isTrue1 = false;
  bool isTrue2 = false;
  bool isTrue3 = false;

  void _showSubPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            title: Text('second page'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: TypewriterAnimatedTextKit(
                  duration: Duration(milliseconds: 3000),
                  isRepeatingAnimation: false,
                  onTap: () {
                    print('Tap event');
                  },
                  text: [
                    'The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris,\n France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.',
                  ],
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'century',
                    color: Colors.black26,
                  ),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget> txt() {
    return Future.delayed(
        Duration(milliseconds: 2000),
        () => TypewriterAnimatedTextKit(
              duration: Duration(milliseconds: 3000),
              isRepeatingAnimation: false,
              text: [
                'Seoul Zoo is home to almost 3,000 animals belonging to about 350 species from all over the world. \n ' +
                    'The zoo is the 10th largest in the world and a recognized member of the International Species Information System (ISIS)' +
                    'and the World Zoo Organization',
              ],
              textStyle: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'century',
                  color: Colors.black,
                  shadows: [
                    Shadow(color: Colors.grey[400], offset: Offset(1, 1)),
                  ]),
              textAlign: TextAlign.left,
              alignment: AlignmentDirectional.topStart,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showSubPage(context),
          child: Icon(Icons.arrow_forward),
        ),
        backgroundColor: Colors.deepPurple[800],
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                  child: Container(
                width: double.infinity,
                height: 60,
                // color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  'Seoul Grand Park',
                  style: TextStyle(fontSize: 30, fontFamily: 'cookie'),
                ),
              )),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTrue1 = !isTrue1;
                            isTrue1 ? height1 = 200 : height1 = 80;
                            isTrue1 ? maxCircular1 = 10 : maxCircular1 = 80;
                            if (isTrue1) {
                              isTrue2 = false;
                              isTrue3 = false;
                              height2 = 80;
                              height3 = 80;
                              maxCircular2 = 80;
                              maxCircular3 = 80;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          curve: Curves.easeOut,
                          width: width,
                          height: height1,
                          child: Visibility(
                            visible: isTrue1,
                            child: Container(
                              width: 300,
                              child: FutureBuilder(
                                future: txt(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                      return Text("");
                                    case ConnectionState.waiting:
                                      return Text("");
                                    default:
                                      if (snapshot.hasError) {
                                        return Text('');
                                      } else {
                                        return snapshot.data;
                                      }
                                  }
                                },
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/sp1.jpg'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(80, 0, 0, 0),
                                offset: Offset(5, 3),
                                blurRadius: 3,
                              )
                            ],
                            borderRadius: BorderRadius.circular(maxCircular1),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTrue2 = !isTrue2;
                            isTrue2 ? height2 = 200 : height2 = 80;
                            isTrue2 ? maxCircular2 = 10 : maxCircular2 = 80;
                            if (isTrue2) {
                              isTrue1 = false;
                              isTrue3 = false;
                              height1 = 80;
                              height3 = 80;
                              maxCircular1 = 80;
                              maxCircular3 = 80;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          curve: Curves.easeOut,
                          width: width,
                          height: height2,
                          child: Visibility(
                            visible: isTrue2,
                            child: Container(
                              width: 300,
                              child: FutureBuilder(
                                future: txt(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                      return Text("");
                                    case ConnectionState.waiting:
                                      return Text("");
                                    default:
                                      if (snapshot.hasError) {
                                        return Text('');
                                      } else {
                                        return snapshot.data;
                                      }
                                  }
                                },
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/sp2.jpg'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(80, 0, 0, 0),
                                offset: Offset(5, 3),
                                blurRadius: 3,
                              )
                            ],
                            borderRadius: BorderRadius.circular(maxCircular2),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTrue3 = !isTrue3;
                            isTrue3 ? height3 = 200 : height3 = 80;
                            isTrue3 ? maxCircular3 = 10 : maxCircular3 = 80;
                            if (isTrue3) {
                              isTrue1 = false;
                              isTrue2 = false;
                              height1 = 80;
                              height2 = 80;
                              maxCircular1 = 80;
                              maxCircular2 = 80;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          curve: Curves.easeOut,
                          width: width,
                          height: height3,
                          child: Visibility(
                            visible: isTrue3,
                            child: Container(
                              width: 300,
                              child: FutureBuilder(
                                future: txt(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                      return Text("");
                                    case ConnectionState.waiting:
                                      return Text("");
                                    default:
                                      if (snapshot.hasError) {
                                        return Text('');
                                      } else {
                                        return snapshot.data;
                                      }
                                  }
                                },
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/sp3.jpg'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(80, 0, 0, 0),
                                offset: Offset(5, 3),
                                blurRadius: 3,
                              )
                            ],
                            borderRadius: BorderRadius.circular(maxCircular3),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
