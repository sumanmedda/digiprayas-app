import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  const Content({
    super.key,
    required this.h,
    required this.w,
    required this.titleText,
    required this.buttontext,
    required this.onPressed,
  });

  final double h;
  final double w;
  final String titleText;
  final String buttontext;
  final VoidCallback onPressed;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleText,
          style: const TextStyle(fontSize: 20),
        ),
        SizedBox(height: widget.h * 0.01),
        Container(
          width: widget.w * 0.45,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.buttontext,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
