import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.height,
    required this.radius,
    required this.backGroundColor,
    required this.foreGroundColor,
    required this.value,
  }) : super(key: key);

  final double value;
  final double radius;
  final Color backGroundColor;
  final Color foreGroundColor;
  final double height;
  @override
  Widget build(BuildContext context) {
    GlobalKey backgroundKey = GlobalKey();
    return SizedBox(
      height: height,
      child: SizedBox.expand(
        child: Container(
          key: backgroundKey,
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            children: [
              LayoutBuilder(builder: (context, contraints) {
                final size = value * backgroundKey.currentContext!.size!.width;
                return Container(
                  width: size,
                  decoration: BoxDecoration(
                    color: foreGroundColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                );
              }),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
