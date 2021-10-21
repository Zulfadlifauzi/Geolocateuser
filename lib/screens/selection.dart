import 'package:flutter/material.dart';
import 'package:locategeouser/screens/training/training_home.dart';
import 'package:locategeouser/screens/webview/webview_home.dart';
import 'package:lottie/lottie.dart';

import 'getlocation/home_page.dart';
import 'localpush/localpn.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        centerTitle: true,
        title: Text(
          'PRESENTATION',
          style: TextStyle(letterSpacing: 5),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 30),
            child: Column(
              children: [
                Text(
                  'Hello everyone,\nWelcome to Fauzis Presentation,\nChoose your experience!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 60, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              color: Colors.lightGreenAccent,
                              offset: Offset(0, 0))
                        ]),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Lottie.asset('assets/lottie/car.json', height: 150),
                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text('GetLocation'))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LocalPush()));
                  },
                  child: Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 1,
                              color: Colors.lightGreenAccent)
                        ]),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Lottie.asset('assets/lottie/hero.json', height: 150),
                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text('Local Push Notification'))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreens()));
                  },
                  child: Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              offset: Offset(0, 0),
                              color: Colors.lightGreenAccent)
                        ]),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Lottie.asset('assets/lottie/spiderman.json',
                              height: 150),
                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text('WebView'))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => trainingHomeScreen()));
                  },
                  child: Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 1,
                              color: Colors.lightGreenAccent)
                        ]),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Lottie.asset('assets/lottie/deadpool.json',
                              height: 150),
                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text('UI Design'))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
