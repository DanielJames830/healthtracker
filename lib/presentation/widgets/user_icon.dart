import 'package:flutter/material.dart';

class UserIconChip extends StatelessWidget {
  const UserIconChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ClipOval(
          child:
              Image.network("https://cdn.discordapp.com/attachments/954926822024417331/1060579421540585482/image.png")),
    );
  }
}
