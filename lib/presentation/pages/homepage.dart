import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthtracker/main.dart';
import 'package:healthtracker/presentation/Style.dart';
import 'package:healthtracker/presentation/pages/diet_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/progress_card.dart';
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
                padding: const EdgeInsets.all(24.0),
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
                                style: style.subtitleFontStyle.copyWith(color: style.fontColor),
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
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ProgressCard(
                        title: "Today's Progress",
                        subtitle: "You got this!",
                        body: Column(
                          children: [
                            DailyTracker(
                              icon: FontAwesomeIcons.fire,
                              currentValue: "800 cal",
                              maxValue: "1500 cal",
                              style: style,
                              progress: 0.4,
                              iconColor: Colors.orange,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DailyTracker(
                              icon: FontAwesomeIcons.glassWater,
                              currentValue: "56 oz",
                              maxValue: "128 oz",
                              style: style,
                              progress: 0.4,
                              iconColor: style.primaryColor,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DailyTracker(
                              icon: FontAwesomeIcons.personWalking,
                              currentValue: "3,000 steps",
                              maxValue: "10,00 steps",
                              style: style,
                              progress: 0.3,
                              iconColor: Colors.amber,
                            ),
                          ],
                        ),
                        color: style.foreGroundColor,
                      ),
                    ),
                    GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 3.5,
                      children: [
                        ...[
                          CategoryCard(
                            style: style,
                            imageURL:
                                "https://cdn.discordapp.com/attachments/954926822024417331/1060709458579292231/image.png",
                            title: "My Water",
                            useDarkText: false,
                          ),
                          CategoryCard(
                            style: style,
                            imageURL:
                                "https://cdn.discordapp.com/attachments/954926822024417331/1060713164175585280/image.png",
                            title: "My Diet",
                            useDarkText: true,
                            page: const DietPage(),
                          ),
                          CategoryCard(
                            style: style,
                            imageURL:
                                "https://cdn.discordapp.com/attachments/954926822024417331/1060715873498845224/image.png",
                            title: "My Health",
                            useDarkText: true,
                          ),
                          CategoryCard(
                            style: style,
                            imageURL:
                                "https://cdn.discordapp.com/attachments/954926822024417331/1060731800252596324/image.png",
                            title: "My Activity",
                            useDarkText: true,
                          )
                        ]
                      ],
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

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.style,
    required this.imageURL,
    required this.title,
    required this.useDarkText,
    this.page,
  }) : super(key: key);

  final Style style;
  final String imageURL;
  final String title;
  final bool useDarkText;
  final Widget? page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page!,
              ));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(108, 180, 180, 180),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageURL),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: style.titleFontStyle.copyWith(
                    color: useDarkText ? style.fontColor : Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
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
    required this.iconColor,
  }) : super(key: key);

  final Color iconColor;
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
          leading: Icon(icon, color: iconColor),
          backgroundColor: style.primaryColor,
          progressColor: style.emphasisColor,
          percent: progress,
        ),
      ],
    );
  }
}
