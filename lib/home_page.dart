import 'dart:convert';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:training_app/video_info.dart';
import "colors.dart" as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value) as List;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            // Training  Row
            Row(
              children: <Widget>[
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 26,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(width: 3),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(width: 7),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Your Program Row
            Row(
              children: <Widget>[
                Text(
                  "Your Program",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Get.to(() => const VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: color.AppColor.homePageIcons,
                  ),
                ),
                // Another way:
                // IconButton(
                //   onPressed: () => Get.to(
                //     () => const VideoInfo(),
                //   ),
                //   icon: Icon(Icons.arrow_forward,size: 18, color:color.AppColor.homePageIcons),
                // ),
              ],
            ),
            const SizedBox(height: 15),
            // Next Workout Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 175,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond.withOpacity(0.85),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(90),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: const Offset(5, 10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond.withOpacity(0.2),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 15, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Next Workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 26,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "and Gluts Workout",
                      style: TextStyle(
                        fontSize: 26,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    // const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          child: const Icon(Icons.play_circle_fill,
                              color: Colors.white, size: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4, 8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // You're doing great Container
            Container(
              height: 120,
              margin: const EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 15),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/card.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(8, 10),
                          color:
                              color.AppColor.gradientSecond.withOpacity(0.35),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(-2, -5),
                          color:
                              color.AppColor.gradientSecond.withOpacity(0.35),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 190, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/figure.png",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 150, top: 35),
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "You are doing great!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Keep it up\n",
                            style: TextStyle(
                              color: color.AppColor.homePagePlanColor,
                              fontSize: 16,
                            ),
                            children: const [
                              TextSpan(
                                text: "Stick to your plan",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Area of Focus
            Row(
              children: [
                Text(
                  "Area of Focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: info.length.toDouble() ~/ 2,
                      itemBuilder: (context, index) {
                        int a = (2 * index); // 0 2
                        int b = (2 * index) + 1; // 1 3
                        return Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 140,
                              margin: const EdgeInsets.only(
                                  left: 30, bottom: 10, top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    info[a]["img"],
                                  ),
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(5, 5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-5, -5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[a]["title"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 140,
                              margin: const EdgeInsets.only(
                                  left: 30, bottom: 10, top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    info[b]["img"],
                                  ),
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(5, 5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-5, -5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[b]["title"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
