import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supply_demand_covid19/ui/welcome/welcome.dart';

class SplashscreenPage extends StatefulWidget {
  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    super.initState();
    _startSplashscreen();
  }

  _startSplashscreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context,
        PageTransition(type: PageTransitionType.fade, child: WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/logo_splashscreen.png',
              width: ScreenUtil().setWidth(140),
              height: ScreenUtil().setHeight(140),
            ),
            SizedBox(height: ScreenUtil().setHeight(40)),
            RichText(
              text: TextSpan(
                text: 'App Kebutuhan\nBantuan Barang\n',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 6,
                  ),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Covid-19',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        color: Color(0xFFE51212),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
