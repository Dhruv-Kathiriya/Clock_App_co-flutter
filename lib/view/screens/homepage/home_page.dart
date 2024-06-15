import 'dart:async';

import 'package:colckapp/utilis/routes/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dropdownVal;
  int hour = 0;
  int minute = 0;
  int second = 0;

  bool isDigital = true;
  DateTime dateTime = DateTime.now();
  List Month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List dayName = [
    "Mon",
    "Tue",
    "Wen",
    "Thus",
    "Fri",
    "Sat",
    "Sun",
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Timer.periodic(Duration(seconds: 1), (timer) {
      dateTime = DateTime.now();
      hour = dateTime.hour;
      minute = dateTime.minute;
      second = dateTime.second;
      setState(() {});
    });
    double value = 0;
    /*Timer(Duration(seconds: 2), () {
      setState(() {});
    });*/
    return Scaffold(
      backgroundColor: Color(0xffEFF9FF),
      appBar: AppBar(
        foregroundColor: Color(0xff3f6080),
        backgroundColor: Color(0xffEFF9FF),
        centerTitle: true,
        title: const Text(
          "Timer App ",
          style: TextStyle(
            color: Color(0xff3f6080),
          ),
        ),
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Dhruv"),
              accountEmail: Text("dhruvkathiriya933@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/150034575?v=4"),
              ),
            ),
            ListTile(
              leading: Text("01"),
              title: Text("Digital Colock"),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: "India",
                  child: Text(
                    "India",
                    style: TextStyle(
                      color: Color(0xff3f6080),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "US",
                  child: Text(
                    "US",
                    style: TextStyle(
                      color: Color(0xff3f6080),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "USA",
                  child: Text(
                    "USA",
                    style: TextStyle(
                      color: Color(0xff3f6080),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "Canada",
                  child: Text(
                    "Canada",
                    style: TextStyle(
                      color: Color(0xff3f6080),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "China",
                  child: Text(
                    "China",
                    style: TextStyle(
                      color: Color(0xff3f6080),
                    ),
                  ),
                ),
              ],
              value: dropdownVal,
              hint: Text(
                "Selected",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                  color: Color(0xff3f6080),
                ),
              ),
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(15),
              dropdownColor: Colors.grey.shade300,
              underline: Container(),
              onChanged: (value) {
                dropdownVal = value;
                setState(() {});
              },
            ),
            /* Image(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/realistic-galaxy-background_23-2148991322.jpg"),
              fit: BoxFit.cover,
            ),*/
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${dayName[dateTime.weekday - 1]},${(dateTime.day).toString().padLeft(2, '0')}  ${Month[dateTime.month - 1]}   ${dateTime.year}",
                      style: TextStyle(
                        color: Color(0xff3f6080),
                        fontSize: textScaler.scale(20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${(hour % 12).toString().padLeft(2, '0')} : ${(minute).toString().padLeft(2, '0')} : ${(second).toString().padLeft(2, '0')}",
                      style: TextStyle(
                          fontSize: textScaler.scale(50),
                          color: Color(0xff3f6080),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Center(
                      child: Text(
                        "\n${(hour < 12) ? 'AM' : 'PM'}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3f6080),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.15,
                    decoration: BoxDecoration(
                      color: Color(0xff3f6080),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffcadbeb).withOpacity(.9),
                          spreadRadius: 4,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: h * 0.06,
                    width: w * 0.15,
                    decoration: BoxDecoration(
                      color: Color(0xff3f6080),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffcadbeb),
                          spreadRadius: 3.5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.alarm,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.secondPage);
                      },
                    ),
                  ),
                  Container(
                    height: h * 0.06,
                    width: w * 0.15,
                    decoration: BoxDecoration(
                      color: Color(0xff3f6080),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffcadbeb),
                          spreadRadius: 3.5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.work_history_sharp,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.thirdPage);
                      },
                    ),
                  ),
                  Container(
                    height: h * 0.06,
                    width: w * 0.15,
                    decoration: BoxDecoration(
                      color: Color(0xff3f6080),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffcadbeb).withOpacity(.9),
                          spreadRadius: 3.5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.fourPage);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
