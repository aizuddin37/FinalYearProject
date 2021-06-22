import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageAll extends StatefulWidget {
  @override
  _WebPageAllState createState() => _WebPageAllState();
}

class _WebPageAllState extends State<WebPageAll> {
  WebViewController webViewCtrl;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      //all other data
        child:
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.pushNamed(context, '/'); // Original
              },
            ),
            iconTheme: IconThemeData(color: Colors.amber),
            backgroundColor: Colors.white,
            title: new Text(
              "Prediction Page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: WebView(
            initialUrl: "https://theonlyinfo.com",

            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              webViewCtrl = controller;
            },
          ),
        ));
  }
}