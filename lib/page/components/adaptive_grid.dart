import 'package:flutter/material.dart';

class AdaptiveGrid extends StatelessWidget {
  final List<Widget> children;

  const AdaptiveGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 670;
    return isSmallScreen
        ? Column(children: children)
        : Row(children: children.map((e) => Expanded(child: e)).toList());
  }
}
