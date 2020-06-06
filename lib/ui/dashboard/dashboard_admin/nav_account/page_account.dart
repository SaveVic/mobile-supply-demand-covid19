import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(26),
        bottom: ScreenUtil().setHeight(35),
        left: ScreenUtil().setWidth(24),
        right: ScreenUtil().setWidth(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Profil Saya',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(16),
                      color: Color(0xFF3B3F44),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Admin 1',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              color: Color(0xFF9A9A9A),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Text(
                          'admin111@mail.com',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Color(0xFF9A9A9A),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: ScreenUtil().setWidth(70),
                      height: ScreenUtil().setHeight(29),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(21)),
                        color: Color(0xFF9A9A9A),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Edit',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color(0xFF3B3F44),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Text(
                  'ADMIN',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color(0xFF9A9A9A),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(24)),
                Divider(
                  thickness: 0.0,
                  color: Color(0xFF9A9A9A).withOpacity(0.2),
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(311),
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8)),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            alignment: Alignment.center,
            child: Text(
              'LOGOUT',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  color: Color(0xFF3B3F44),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
