import 'package:flutter/material.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  //initialize webview controller
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        "https://app.livechatai.com/aibot-iframe/clrheipw8000ul20f3s79rimb"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          "المُساعــد الرقمــى",
          style: kReusableTextStyle,
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
