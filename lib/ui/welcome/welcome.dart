import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supply_demand_covid19/ui/login/login.dart';
import 'package:supply_demand_covid19/ui/register/register.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/logo_splashscreen.png',
              width: ScreenUtil().setWidth(190),
              height: ScreenUtil().setHeight(190),
            ),
            SizedBox(height: ScreenUtil().setHeight(22)),
            Text(
              'Selamat Datang!',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 6,
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            Text(
              'Silakan masuk untuk melanjutkan',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9A9A9A),
                  letterSpacing: 6,
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(32)),
            MaterialButton(
              minWidth: ScreenUtil().setWidth(237),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: LoginPage(), type: PageTransitionType.rightToLeft),
                );
              },
              child: Text(
                'LOGIN',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(16),
                    letterSpacing: 17,
                  ),
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(24)),
            MaterialButton(
              minWidth: ScreenUtil().setWidth(237),
              color: Colors.white,
              textColor: Theme.of(context).primaryColor,
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: RegisterPage(),
                      type: PageTransitionType.rightToLeft),
                );
              },
              child: Text(
                'DAFTAR',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(16),
                    letterSpacing: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
