import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../utilis/routes/routes.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int hour = 0;
  int minute = 0;
  int second = 0;

  bool isDigital = true;
  DateTime dateTime = DateTime.now();
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
    return Scaffold(
      backgroundColor: Color(0xffEFF9FF),
      appBar: AppBar(
        backgroundColor: Color(0xffEFF9FF),
        centerTitle: true,
        title: Text("Analog Colock"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(hour % 12).toString().padLeft(2, '0')}:${(minute).toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: textScaler.scale(75),
                          color: Color(0xff3f6080),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\n${(hour < 12) ? 'AM' : 'PM'}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3f6080),
                          fontSize: textScaler.scale(22),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: h * 0.6,
                    width: w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffecf6ff),
                          Color(0xffcadbeb),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff3f6080).withOpacity(.7),
                          blurRadius: 32,
                          offset: Offset(40, 20),
                        ),
                        BoxShadow(
                          color: Color(0xffffffff).withOpacity(.8),
                          blurRadius: 32,
                          offset: Offset(-20, -10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ...List.generate(
                60,
                (index) => Transform.rotate(
                  angle: (index * (pi * 2)) / 60,
                  child: Divider(
                    color: (index % 5 == 0) ? Colors.red : Colors.black,
                    endIndent: (index % 5 == 0) ? w * 0.84 : w * 0.88,
                    thickness: (index % 5 == 0) ? 4 : 2,
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 7.5,
              ),
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (hour % 12 + (minute / 60)) * (pi * 2) / 12,
                  child: Divider(
                    color: Colors.black,
                    thickness: 4,
                    endIndent: w * 0.4,
                    indent: w * 0.20,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (minute * (pi * 2)) / 60,
                  child: Divider(
                    color: Colors.red,
                    thickness: 2,
                    endIndent: w * 0.4,
                    indent: w * 0.16,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (second * (pi * 2)) / 60,
                  child: Divider(
                    color: Colors.red,
                    thickness: 3,
                    endIndent: w * 0.4,
                    indent: w * 0.12,
                  ),
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
                        onPressed: () {
                          Navigator.pop(context);
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
                          Icons.alarm,
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
      ),
    );
  }
}
