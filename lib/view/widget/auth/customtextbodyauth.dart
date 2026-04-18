import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String content;
  const CustomTextBodyAuth({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
