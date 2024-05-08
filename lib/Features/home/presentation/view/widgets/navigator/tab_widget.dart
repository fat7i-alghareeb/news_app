import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String label;
  const TabWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Tab(text: label),
    );
  }
}
