import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project/constant.dart';
import 'package:project/screens/Create_Project/create_project_screen.dart';
import 'package:project/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getScreenWidth(10),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getScreenWidth(20),
              ),
              child: Text(
                'Projects',
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: getScreenWidth(10),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: getScreenWidth(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CreateProjectScreen.routeName);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: getScreenWidth(5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: getScreenWidth(180),
                        width: getScreenWidth(120),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: kPrimaryColor,
                              size: getScreenWidth(32),
                            ),
                            Text(
                              'Add',
                              style: TextStyle(
                                fontSize: getScreenWidth(16),
                                color: kTextColor,
                              ),
                            ),
                            Text(
                              'Project',
                              style: TextStyle(
                                fontSize: getScreenWidth(16),
                                color: kTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: getScreenWidth(20)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: getScreenWidth(6),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: getScreenWidth(180),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getScreenWidth(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: CircularPercentIndicator(
                                  radius: getScreenWidth(120),
                                  lineWidth: getScreenWidth(14),
                                  percent: 0.75,
                                  center: new Text(
                                    "75%",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: getScreenWidth(22),
                                    ),
                                  ),
                                  progressColor: kPrimaryColor,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  fillColor: kPrimaryColor.withOpacity(0.1),
                                ),
                              ),
                              SizedBox(
                                width: getScreenWidth(20),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Website',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: getScreenWidth(22),
                                      color: kTextColor,
                                    ),
                                  ),
                                  Text(
                                    'PT GDI',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: getScreenWidth(18),
                                      color: kTextColor,
                                    ),
                                  ),
                                  Text(
                                    '07/05/2021',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: getScreenWidth(18),
                                      color: kTextColor.withOpacity(0.75),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getScreenWidth(10),
                                  ),
                                  Container(
                                    height: getScreenWidth(50),
                                    width: getScreenWidth(190),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Positioned(
                                          height: getScreenWidth(50),
                                          width: getScreenWidth(50),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/Profile.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: getScreenWidth(35),
                                          height: getScreenWidth(50),
                                          width: getScreenWidth(50),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/Profile.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: getScreenWidth(70),
                                          height: getScreenWidth(50),
                                          width: getScreenWidth(50),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/Profile.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: getScreenWidth(105),
                                          height: getScreenWidth(50),
                                          width: getScreenWidth(50),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/Profile.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: getScreenWidth(140),
                                          height: getScreenWidth(50),
                                          width: getScreenWidth(50),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/Profile.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
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
                    ),
                  ),
                  SizedBox(
                    width: getScreenWidth(20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getScreenWidth(30),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getScreenWidth(20),
              ),
              child: Text(
                'Deadlines',
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: getScreenWidth(10),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: getScreenWidth(20)),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: getScreenWidth(5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getScreenWidth(10),
                            vertical: getScreenWidth(10),
                          ),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Project Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getScreenWidth(18),
                                    color: kTextColor,
                                  ),
                                ),
                                Text(
                                  'Company',
                                  style: TextStyle(
                                    fontSize: getScreenWidth(16),
                                    color: kTextColor,
                                  ),
                                ),
                                SizedBox(
                                  height: getScreenWidth(10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Task',
                                      style: TextStyle(
                                        fontSize: getScreenWidth(14),
                                        color: kTextColor,
                                      ),
                                    ),
                                    Text(
                                      '7 Mei 2021',
                                      style: TextStyle(
                                        fontSize: getScreenWidth(14),
                                        color: kTextColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
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
    );
  }
}
