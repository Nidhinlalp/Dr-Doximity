import 'package:flutter/material.dart';

class ComonHedlineWidget extends StatelessWidget {
  const ComonHedlineWidget({
    super.key,
    required this.head,
    required this.content,
  });

  final String head;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$head :',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          ' $content',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
