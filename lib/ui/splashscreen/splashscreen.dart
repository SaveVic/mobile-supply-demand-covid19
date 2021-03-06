import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supply_demand_covid19/resources/personal_data_key.dart';
import 'package:supply_demand_covid19/ui/home/home.dart';
import 'package:supply_demand_covid19/ui/welcome/welcome.dart';
import 'package:supply_demand_covid19/resources/res_splashscreen.dart';

class SplashscreenPage extends StatefulWidget {
  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  final _storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    _startSplashscreen();
  }

  _startSplashscreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () async {
      var jwt = await _storage.read(key: data_jwt_key);
      // Navigator.pushReplacementNamed(
      //     context, (jwt == null) ? '/welcome' : '/home');
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: (jwt == null) ? WelcomePage() : HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              logo_source,
              width: ScreenUtil().setWidth(logo_dimen),
              height: ScreenUtil().setHeight(logo_dimen),
            ),
            SizedBox(height: ScreenUtil().setHeight(40)),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(font_size),
                    fontStyle: FontStyle.normal,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: letter_spacing,
                  ),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: subtitle,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(font_size),
                        fontStyle: FontStyle.normal,
                        color: Color(subtitle_color_hex),
                        fontWeight: FontWeight.bold,
                        letterSpacing: letter_spacing,
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
