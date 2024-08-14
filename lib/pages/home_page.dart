import 'package:digiprayas/pages/local_storage.dart';
import 'package:digiprayas/pages/web_mail.dart';
import 'package:flutter/material.dart';

import '../widgets/content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: h * 0.1, left: w * 0.05, right: w * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/DIGIPRAYAS.png')),
            ),
            const Center(
              child: Text(
                'Welcome To Digiprayas',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                'Go Digital Grow Digital!!!',
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: h * 0.05),
            Content(
              h: h,
              w: w,
              titleText: 'Access To WebMail',
              buttontext: 'MailBook',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Webmail()));
              },
            ),
            SizedBox(height: h * 0.05),
            Content(
              h: h,
              w: w,
              titleText: 'Access To Local Storage',
              buttontext: 'Local Data',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocalStorage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
