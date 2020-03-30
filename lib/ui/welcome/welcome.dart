import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supply_demand_covid19/resources/res_welcome.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              logo_source,
              width: ScreenUtil().setWidth(logo_dimen),
              height: ScreenUtil().setHeight(logo_dimen),
            ),
            SizedBox(height: ScreenUtil().setHeight(22)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(title_size),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: letter_spacing,
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(subtitle_size),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: Color(subtitle_color_hex),
                  letterSpacing: letter_spacing,
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(32)),
            MaterialButton(
              minWidth: ScreenUtil().setWidth(button_width),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(button_padding)),
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
                button_title_login,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil().setSp(button_text_size),
                    letterSpacing: button_letter_spacing,
                  ),
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(24)),
            MaterialButton(
              minWidth: ScreenUtil().setWidth(button_width),
              color: Colors.white,
              textColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(button_padding)),
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
                button_title_daftar,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil().setSp(button_text_size),
                    letterSpacing: button_letter_spacing,
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
