import 'package:flutter/material.dart';

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
  List timerColck = [];

  void clockTimer() async {
    isStop = true;
    await Future.delayed(Duration(milliseconds: 100), () {
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

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      backgroundColor: const Color(0xffEFF9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xffEFF9FF),
        title: const Text("Stop Watch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h * 0.06,
                  width: w * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xff3f6080),
                    borderRadius: BorderRadius.circular(10),
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
                Container(
                  height: h * 0.06,
                  width: w * 0.05,
                  decoration: BoxDecoration(
                    color: Color(0xff3f6080),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      ":",
                      style: TextStyle(
                        fontSize: textScaler.scale(30),
                      ),
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
                    color: Color(0xff3f6080),
                    borderRadius: BorderRadius.circular(10),
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
                Container(
                  height: h * 0.06,
                  width: w * 0.05,
                  decoration: BoxDecoration(
                    color: Color(0xff3f6080),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      ":",
                      style: TextStyle(
                        fontSize: textScaler.scale(30),
                      ),
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
                    color: Color(0xff3f6080),
                    borderRadius: BorderRadius.circular(10),
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
                    backgroundColor: Color(0xff3f6080),
                    shadowColor: Color(0xffEFF9FF),
                  ),
                  onPressed: () {
                    if (!isStop) {
                      clockTimer();
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Start",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(
                      0xff3f6080,
                    ),
                    shadowColor: Color(0xffEFF9FF),
                  ),
                  onPressed: () {
                    isStop = false;
                    timerColck.add(());
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  label: Text(
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
                backgroundColor: Color(0xff3f6080),
                shadowColor: Color(0xffEFF9FF),
              ),
              onPressed: () {
                isStop = false;
                hh = mm = 0;
                ss = 0;
                timerColck = [];
                setState(() {});
              },
              icon: Icon(
                Icons.restart_alt,
                color: Colors.black,
              ),
              label: Text(
                "Restart",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
