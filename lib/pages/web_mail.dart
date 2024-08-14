import 'package:flutter/material.dart';
import '../widgets/page_title.dart';

class Webmail extends StatefulWidget {
  const Webmail({super.key});

  @override
  State<Webmail> createState() => _WebmailState();
}

class _WebmailState extends State<Webmail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const PageTitle(
            title: 'WEBMAIL',
          ),
          SizedBox(
            height: h * 0.04,
          ),
          SizedBox(
            width: double.infinity,
            height: h * 0.8,
            child: const Text('data'),
          )
        ],
      ),
    );
  }
}
