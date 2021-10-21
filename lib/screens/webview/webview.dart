import 'package:flutter/material.dart';
import 'package:locategeouser/screens/webview/webview_home.dart';
import 'package:locategeouser/ui/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreens extends StatefulWidget {
  const WebViewScreens({Key? key}) : super(key: key);

  @override
  _WebViewScreensState createState() => _WebViewScreensState();
}

class _WebViewScreensState extends State<WebViewScreens> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[600],
          leading: IconButton(
            icon: const Icon(
              Icons.clear,
              color: blackClr,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreens()));
            },
          ),
          title: const Text(
            'Tarsoft.co',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: blackClr,
                )),
            IconButton(
                onPressed: () {
                  controller.reload();
                  controller.clearCache();
                  CookieManager().clearCookies();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: blackClr,
                ))
          ],
        ),
        body: WebView(
          initialUrl: 'https://tarsoft.co',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      ),
    );
  }
}
