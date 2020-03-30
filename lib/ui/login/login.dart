import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supply_demand_covid19/resources/res_login.dart';
import 'package:supply_demand_covid19/ui/register/register.dart';
import 'package:supply_demand_covid19/ui/reset_password/reset_password.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _initialEmail = "";
  String _initialPassword = "";
  bool _isPasswordVisible = false;
  bool _isShowErrorMessageEmail = false;
  bool _isShowErrorMessagePassword = false;

  Widget _showErrorMessageWidget(bool isShow, String message) => (!isShow)
      ? Container()
      : Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: ScreenUtil().setHeight(4)),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  message,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(normal_text_size),
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                      letterSpacing: normal_letter_spacing,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

  _performLogin(String email, String password) {
    TODO:
    'implement login';
  }

  _forgotPassword() {
    Navigator.pushReplacement(
      context,
      PageTransition(
          child: ResetPasswordPage(), type: PageTransitionType.rightToLeft),
    );
  }

  _toRegisterPage() {
    Navigator.pushReplacement(
      context,
      PageTransition(
          child: RegisterPage(), type: PageTransitionType.rightToLeft),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController =
        TextEditingController(text: _initialEmail);
    TextEditingController _passwordController =
        TextEditingController(text: _initialPassword);

    _saveData() {
      _initialEmail = _emailController.value.text;
      _initialPassword = _passwordController.value.text;
    }

    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(padding_vertical),
                left: ScreenUtil().setWidth(padding_horizontal),
                right: ScreenUtil().setWidth(padding_horizontal),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          logo_source,
                          width: ScreenUtil().setWidth(logo_dimen),
                          height: ScreenUtil().setWidth(logo_dimen),
                        ),
                        SizedBox(width: ScreenUtil().setHeight(16)),
                        Text(
                          title_text,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(title_text_size),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).primaryColor,
                              letterSpacing: normal_letter_spacing,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(41.5)),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      email_text,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(normal_text_size),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Color(color_label_hex),
                          letterSpacing: normal_letter_spacing,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(8)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setHeight(10)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(color_input_hex),
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(normal_text_size),
                          letterSpacing: normal_letter_spacing,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                    ),
                  ),
                  _showErrorMessageWidget(
                      _isShowErrorMessageEmail, 'Email tidak boleh kosong'),
                  SizedBox(height: ScreenUtil().setHeight(24.4)),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      password_text,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(normal_text_size),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Color(color_label_hex),
                          letterSpacing: normal_letter_spacing,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(8)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(color_input_hex),
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(normal_text_size),
                          letterSpacing: normal_letter_spacing,
                        ),
                      ),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _saveData();
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon((_isPasswordVisible)
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: InputBorder.none,
                      ),
                      obscureText: (_isPasswordVisible) ? false : true,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                    ),
                  ),
                  _showErrorMessageWidget(_isShowErrorMessagePassword,
                      'Password tidak boleh kosong'),
                  SizedBox(height: ScreenUtil().setHeight(13)),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _forgotPassword(),
                      child: Text(
                        forgot_text,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(normal_text_size),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                            letterSpacing: normal_letter_spacing,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  MaterialButton(
                    minWidth: ScreenUtil().setWidth(button_width),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onPressed: () {
                      setState(() {
                        _saveData();
                        String e = _emailController.value.text;
                        String p = _passwordController.value.text;
                        _isShowErrorMessageEmail = e.isEmpty;
                        _isShowErrorMessagePassword = p.isEmpty;
                        if (e.isNotEmpty && p.isNotEmpty) {
                          _performLogin(e, p);
                        }
                      });
                    },
                    child: Text(
                      button_text,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil().setSp(button_text_size),
                          letterSpacing: big_letter_spacing,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(24)),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: daftar_title_text,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(normal_text_size),
                          fontStyle: FontStyle.normal,
                          color: Color(color_label_hex),
                          fontWeight: FontWeight.bold,
                          letterSpacing: normal_letter_spacing,
                        ),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: daftar_subtitle_text,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _toRegisterPage(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(normal_text_size),
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: normal_letter_spacing,
                            ),
                          ),
                        ),
                      ],
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
