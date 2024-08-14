import 'package:flutter/material.dart';

class PageTitle extends StatefulWidget {
  const PageTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<PageTitle> createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80.0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black)),
            child: InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20),
          ),
          const Text('')
        ],
      ),
    );
  }
}
