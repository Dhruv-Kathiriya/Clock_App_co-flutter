import 'package:flutter/material.dart';

import '../../../utilis/routes/routes.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  int hh = 0;

  int mm = 0;

  int ss = 0;

  bool isStop = true;

  void clockTimer() async {
    isStop = true;
    await Future.delayed(const Duration(milliseconds: 100), () {
      ss++;
      if (isStop) {
        ss++;
      }
      if (ss > 59) {
        ss = 0;
        mm++;
      }
      if (mm > 59) {
        mm = 0;
        hh++;
      }
      if (hh >= 12) {
        hh = 0;
      }
      setState(() {});
    });
    if (isStop) {
      clockTimer();
    }
  }

  List timerColck = [];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      backgroundColor: const Color(0xffEFF9FF),
      appBar: AppBar(
        foregroundColor: const Color(0xff3f6080),
        backgroundColor: const Color(0xffEFF9FF),
        title: const Text(
          "Stop Watch",
          style: TextStyle(
            color: Color(0xff3f6080),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*  Container(
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
                      ),*/
                      Container(
                        height: h * 0.06,
                        width: w * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffecf6ff),
                              Color(0xffcadbeb),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff3f6080).withOpacity(.7),
                              blurRadius: 32,
                              offset: const Offset(25, 15),
                            ),
                            BoxShadow(
                              color: const Color(0xffffffff).withOpacity(.8),
                              blurRadius: 32,
                              offset: const Offset(-15, -10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "${(hh).toString().padLeft(2, "0")} ",
                            style: TextStyle(
                              fontSize: textScaler.scale(30),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Center(
                        child: Text(
                          ":",
                          style: TextStyle(
                            fontSize: textScaler.scale(30),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Container(
                        height: h * 0.06,
                        width: w * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffecf6ff),
                              Color(0xffcadbeb),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff3f6080).withOpacity(.7),
                              blurRadius: 32,
                              offset: const Offset(25, 15),
                            ),
                            BoxShadow(
                              color: const Color(0xffffffff).withOpacity(.8),
                              blurRadius: 32,
                              offset: const Offset(-15, -10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "${(mm).toString().padLeft(2, "0")} ",
                            style: TextStyle(
                              fontSize: textScaler.scale(30),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Center(
                        child: Text(
                          ":",
                          style: TextStyle(
                            fontSize: textScaler.scale(30),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Container(
                        height: h * 0.06,
                        width: w * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffecf6ff),
                              Color(0xffcadbeb),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff3f6080).withOpacity(.7),
                              blurRadius: 32,
                              offset: const Offset(25, 15),
                            ),
                            BoxShadow(
                              color: const Color(0xffffffff).withOpacity(.8),
                              blurRadius: 32,
                              offset: const Offset(-15, -10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "${(ss).toString().padLeft(2, "0")} ",
                            style: TextStyle(
                              fontSize: textScaler.scale(30),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff3f6080),
                          shadowColor: const Color(0xffEFF9FF),
                        ),
                        onPressed: () {
                          if (!isStop) {
                            clockTimer();
                          }
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Start",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xff3f6080,
                          ),
                          shadowColor: const Color(0xffEFF9FF),
                        ),
                        onPressed: () {
                          isStop = false;
                          timerColck.add({'hour': hh, 'min': mm, 'sec': ss});
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Stop",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3f6080),
                      shadowColor: const Color(0xffEFF9FF),
                    ),
                    onPressed: () {
                      isStop = false;
                      hh = mm = 0;
                      ss = 0;
                      timerColck = [];
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Restart",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...timerColck.map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hour : ${e['hour']} : ",
                              style: TextStyle(
                                  fontSize: textScaler.scale(20),
                                  color: Colors.black),
                            ),
                            Text(
                              "Min : ${e['min']} : ",
                              style: TextStyle(
                                  fontSize: textScaler.scale(20),
                                  color: Colors.black),
                            ),
                            Text(
                              "Sec : ${e['sec']}",
                              style: TextStyle(
                                  fontSize: textScaler.scale(20),
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            IconButton(
                                onPressed: () {
                                  timerColck.remove(e);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.delete,
                                  size: 25,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
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
                        Navigator.pushNamed(
                          context,
                          Routes.thirdPage,
                        );
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
                        Navigator.pop(context);
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
