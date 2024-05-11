import 'package:buburger_app/themes/themes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // baris ke-1
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.asset("assets/image1.png"),
                SizedBox(
                  width: 9,
                ),
                Text(
                  "Buburger",
                  style: splashTextstyle1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // baris ke-2
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jagonya",
                  style: splashTextstyle2.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Burger!",
                  style: splashTextstyle2.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          // baris ke-3
          Image.asset(
            "assets/img-splash.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
