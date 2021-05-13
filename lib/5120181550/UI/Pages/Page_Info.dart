import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Page_Info extends StatelessWidget{

  String title;
  String url;

  Page_Info(
      this.title,
      this.url
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('intent')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
    );
  }
}