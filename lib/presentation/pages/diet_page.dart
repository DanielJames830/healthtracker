import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthtracker/main.dart';
import 'package:healthtracker/presentation/Style.dart';
import 'package:healthtracker/presentation/widgets/progress_card.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class DietPage extends HookWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = MyApp.getStyle();

    final _value = useState<double>(0);

    ValueNotifier<double> value = ValueNotifier(900);

    return Scaffold(
      backgroundColor: style.backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: style.primaryColor,
        title: Text(
          "My Diet",
          style: style.titleFontStyle.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  FittedBox(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "1500",
                                  style: style.titleFontStyle,
                                ),
                                Text(
                                  "goal".toUpperCase(),
                                  style: style.subtitleFontStyle,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SimpleCircularProgressBar(
                                mergeMode: true,
                                backColor: style.primaryColor,
                                size: 200,
                                progressStrokeWidth: 30,
                                maxValue: 1500,
                                valueNotifier: value,
                                progressColors: [
                                  style.secondaryColor,
                                  style.emphasisColor,
                                ],
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: style.foreGroundColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(108, 180, 180, 180),
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${1500 - value.value.round()}",
                                        style: style.titleFontStyle.copyWith(fontSize: 42),
                                      ),
                                      Text(
                                        "kcal left".toUpperCase(),
                                        style: style.subtitleFontStyle.copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${value.value.round()}",
                                  style: style.titleFontStyle,
                                ),
                                Text(
                                  "So far".toUpperCase(),
                                  style: style.subtitleFontStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: GridView.count(
                      childAspectRatio: 10 / 10,
                      crossAxisSpacing: 12,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: [
                        MacroCard(
                          style: style,
                          title: "Protein",
                          units: "g",
                          value: 40,
                        ),
                        MacroCard(
                          style: style,
                          title: "Carbs",
                          units: "g",
                          value: 70,
                        ),
                        MacroCard(
                          style: style,
                          title: "Fats",
                          units: "g",
                          value: 54,
                        ),
                      ],
                    ),
                  ),
                  ProgressCard(
                    title: "My Meals",
                    subtitle: "Looks good!",
                    color: style.foreGroundColor,
                    body: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MealCard(
                            style: style,
                          ),
                          MealCard(
                            style: style,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: style.primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: style.borderRadius),
                              ),
                              icon: Icon(Icons.add, color: style.foreGroundColor),
                              label: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Add Meal",
                                  style: style.subtitleFontStyle.copyWith(color: style.foreGroundColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MacroCard extends StatelessWidget {
  const MacroCard({
    Key? key,
    required this.style,
    required this.title,
    required this.units,
    required this.value,
  }) : super(key: key);

  final Style style;
  final String title;
  final String units;
  final double value;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> _value = ValueNotifier(value);
    return Container(
      decoration: BoxDecoration(
        borderRadius: style.borderRadius,
        color: style.foreGroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(108, 180, 180, 180),
            blurRadius: 10,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            children: [
              Text(
                title,
                style: style.subtitleFontStyle.copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 8,
              ),
              SimpleCircularProgressBar(
                progressColors: [
                  style.secondaryColor,
                  style.emphasisColor,
                ],
                backColor: style.primaryColor,
                valueNotifier: _value,
                progressStrokeWidth: 5,
                backStrokeWidth: 3,
                size: 50,
                mergeMode: true,
                onGetText: (p0) {
                  return (Text(
                    "${(p0).round()} ${units}",
                    style: style.titleFontStyle.copyWith(fontSize: 12),
                  ));
                },
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${100 - value.round()} ${units} left",
                style: style.subtitleFontStyle.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.style,
  }) : super(key: key);

  final Style style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: style.borderRadius,
          color: Colors.grey[100],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox.square(
                    dimension: 50,
                    child: ClipRRect(
                      borderRadius: style.borderRadius,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://takethemameal.com/files_images_v2/stam.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meatloaf",
                      style: style.titleFontStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.fire,
                          size: 16,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "500 cal",
                          style: style.subtitleFontStyle.copyWith(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Icon(
                          FontAwesomeIcons.breadSlice,
                          size: 16,
                          color: style.primaryColor,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "200 g",
                          style: style.subtitleFontStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            )
          ],
        ),
      ),
    );
  }
}
