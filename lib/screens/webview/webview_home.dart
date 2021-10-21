import 'package:flutter/material.dart';
import 'package:locategeouser/screens/webview/webview.dart';
import 'package:locategeouser/ui/theme.dart';
import 'package:lottie/lottie.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          backgroundColor: webViewPrimaryClr,
          appBar: AppBar(
            backgroundColor: Colors.yellow[600],
            centerTitle: true,
            title: const Text(
              'TARSOFT',
              style: TextStyle(color: Colors.black, letterSpacing: 5),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      'WELCOME TO TARSOFT',
                      style: headingStyle,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  width: MediaQuery.of(context).size.width,
                  height: 440,
                  child: Row(
                    children: [Lottie.asset('assets/lottie/hi.json')],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 550),
                        child: Text(
                          'For more info go to our website!',
                          style: subHeadingStyle,
                        ),
                      ),
                      Container(
                        width: 100,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.yellow[600],
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WebViewScreens()));
                          },
                          child: Text(
                            'WEBSITE',
                            style: textButton,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

// _tarsoft() {
//   return const WebView(
//     initialUrl: 'https://tarsoft.co',
//     javascriptMode: JavascriptMode.unrestricted,
//   );
// }
