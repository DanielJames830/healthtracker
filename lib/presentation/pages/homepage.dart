import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthtracker/main.dart';
import 'package:healthtracker/presentation/Style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/category_card.dart';
import '../widgets/user_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = MyApp.getStyle();
    return Scaffold(
      backgroundColor: style.backGroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 64,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome back!",
                                style: style.subtitleFontStyle,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "John Smith",
                                style: style.titleFontStyle,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          const UserIconChip(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CategoryCard(
                        title: "Today's Progress",
                        subtitle: "You got this!",
                        body: Column(
                          children: [
                            DailyTracker(
                              icon: Icons.cookie,
                              currentValue: "800",
                              maxValue: "1500",
                              style: style,
                              progress: 0.4,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DailyTracker(
                              icon: FontAwesomeIcons.shoePrints,
                              currentValue: "3,000",
                              maxValue: "10,00",
                              style: style,
                              progress: 0.3,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DailyTracker(
                              icon: FontAwesomeIcons.glassWater,
                              currentValue: "56",
                              maxValue: "128",
                              style: style,
                              progress: 0.4,
                            ),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Categories",
                      style: style.titleFontStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.discordapp.com/attachments/954926822024417331/1060709458579292231/image.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Water",
                                    style: style.titleFontStyle.copyWith(color: Colors.white, fontSize: 34)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.discordapp.com/attachments/954926822024417331/1060713164175585280/image.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Nutrition", style: style.titleFontStyle.copyWith(fontSize: 34)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.discordapp.com/attachments/954926822024417331/1060715873498845224/image.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Health", style: style.titleFontStyle.copyWith(fontSize: 34)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DailyTracker extends StatelessWidget {
  const DailyTracker({
    Key? key,
    required this.style,
    required this.currentValue,
    required this.maxValue,
    required this.icon,
    required this.progress,
  }) : super(key: key);

  final Style style;
  final double progress;
  final String currentValue;
  final String maxValue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 16),
          child: Row(
            children: [
              Text(
                currentValue,
                style: style.subtitleFontStyle,
              ),
              Expanded(child: Container()),
              Text(maxValue, style: style.subtitleFontStyle)
            ],
          ),
        ),
        LinearPercentIndicator(
          barRadius: const Radius.circular(12),
          lineHeight: 12,
          animation: true,
          leading: Icon(icon, color: style.accentColor),
          backgroundColor: style.primaryColor,
          progressColor: style.accentColor,
          percent: progress,
        ),
      ],
    );
  }
}
