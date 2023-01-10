import 'package:flutter/material.dart';

import '../../main.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;
  final Color color;

  const ProgressCard({
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
        color: color,
        borderRadius: style.borderRadius,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(104, 180, 180, 180),
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: style.titleFontStyle.copyWith(fontSize: 20),
            ),
            Text(subtitle, style: style.subtitleFontStyle),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            body,
          ],
        ),
      ),
    );
  }
}
