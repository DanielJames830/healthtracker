import 'package:flutter/material.dart';

import '../../main.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;
  final Color color;

  const CategoryCard({
    required this.title,
    required this.subtitle,
    required this.body,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final style = MyApp.getStyle();
    return Container(
      decoration: BoxDecoration(
        color: style.foreGroundColor,
        borderRadius: style.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: style.titleFontStyle.copyWith(fontSize: 20),
            ),
            Text(subtitle, style: style.subtitleFontStyle),
            const SizedBox(height: 8),
            body,
          ],
        ),
      ),
    );
  }
}
