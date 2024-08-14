import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/page_title.dart';

class Webmail extends StatefulWidget {
  const Webmail({super.key});

  @override
  State<Webmail> createState() => _WebmailState();
}

class _WebmailState extends State<Webmail> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://mail.hostinger.com'));

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const PageTitle(
              title: 'WEBMAIL',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            SizedBox(
              height: h,
              width: double.infinity,
              child: WebViewWidget(
                controller: controller,
              ),
            )
          ],
        ),
      ),
    );
  }
}
