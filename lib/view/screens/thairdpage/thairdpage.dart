import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../utilis/routes/routes.dart';

class ThairdPage extends StatefulWidget {
  const ThairdPage({super.key});

  @override
  State<ThairdPage> createState() => _ThairdPageState();
}

class _ThairdPageState extends State<ThairdPage> {
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
    Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime = DateTime.now();
      hour = dateTime.hour;
      minute = dateTime.minute;
      second = dateTime.second;
      setState(() {});
    });
    return Scaffold(
      backgroundColor: const Color(0xffEFF9FF),
      appBar: AppBar(
        foregroundColor: Color(0xff3f6080),
        backgroundColor: const Color(0xffEFF9FF),
        centerTitle: true,
        title: Text(
          "Strap Clock",
          style: TextStyle(
            fontSize: textScaler.scale(20),
            color: const Color(0xff3f6080),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(hour % 12).toString().padLeft(2, '0')}:${(minute).toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: textScaler.scale(50),
                          color: const Color(0xff3f6080),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\n${(hour < 12) ? 'AM' : 'PM'}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff3f6080),
                          fontSize: textScaler.scale(12),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${(dateTime.day).toString().padLeft(2, '0')}/${Month[dateTime.month - 1]}   ",
                    style: TextStyle(
                      color: const Color(0xff3f6080),
                      fontSize: textScaler.scale(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Transform.scale(
                scale: 9,
                child: CircularProgressIndicator(
                  strokeWidth: 0.8,
                  color: const Color(0xff3f6080).withOpacity(.4),
                  value: second / 60,
                ),
              ),
              Transform.scale(
                scale: 8,
                child: CircularProgressIndicator(
                  strokeWidth: 1.1,
                  color: Colors.black,
                  value: minute / 60,
                ),
              ),
              Transform.scale(
                scale: 7,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: const Color(0xff3f6080),
                  value: (hour % 12 + (minute / 60)) / 12,
                ),
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
                        color: const Color(0xff3f6080),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffcadbeb).withOpacity(.9),
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
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.homePage);
                        },
                      ),
                    ),
                    Container(
                      height: h * 0.06,
                      width: w * 0.15,
                      decoration: BoxDecoration(
                        color: const Color(0xff3f6080),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
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
                        color: const Color(0xff3f6080),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      height: h * 0.06,
                      width: w * 0.15,
                      decoration: BoxDecoration(
                        color: const Color(0xff3f6080),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffcadbeb).withOpacity(.9),
                            spreadRadius: 3.5,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
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
      ),
    );
  }
}
