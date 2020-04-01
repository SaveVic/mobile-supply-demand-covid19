// import 'package:flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supply_demand_covid19/api_request/api_request.dart';
import 'package:supply_demand_covid19/api_request/user_class.dart';
import 'package:supply_demand_covid19/resources/personal_data_key.dart';
import 'package:supply_demand_covid19/resources/res_login.dart';
import 'package:supply_demand_covid19/ui/home/home.dart';
import 'package:supply_demand_covid19/ui/register/register.dart';
import 'package:supply_demand_covid19/ui/reset_password/reset_password.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _storage = FlutterSecureStorage();
  String _initialEmail = "";
  String _initialPassword = "";
  bool _isPasswordVisible = false;
  bool _isShowErrorMessageEmail = false;
  bool _isShowErrorMessagePassword = false;

  // Flushbar _loading;

  @override
  void initState() {
    super.initState();
    // _loading = Flushbar(
    //   message: 'Sedang Memproses ...',
    //   showProgressIndicator: true,
    //   // progressIndicatorBackgroundColor: Theme.of(context).primaryColor,
    // );
  }

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

  _performLogin(BuildContext context, String email, String password) async {
    // _loading..show(context);
    DataFromRequest data = await ApiRequest.requestLogin(email, password);
    if (data.success) {
      User user = data.data;
      await _storage.write(key: data_email_key, value: user.email);
      await _storage.write(key: data_name_key, value: user.name);
      await _storage.write(key: data_role_key, value: user.role);
      await _storage.write(key: data_jwt_key, value: user.jwt);
      // _loading.dismiss();
      Fluttertoast.showToast(
          msg: data.message, toastLength: Toast.LENGTH_SHORT);
      // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(child: HomePage(), type: PageTransitionType.fade),
        (route) => false,
      );
    } else {
      // _loading.dismiss();
      Fluttertoast.showToast(
          msg: data.message, toastLength: Toast.LENGTH_SHORT);
    }
  }

  _forgotPassword() {
    // Navigator.pushReplacementNamed(context, '/reset_password');
    Navigator.pushReplacement(
      context,
      PageTransition(
          child: ResetPasswordPage(), type: PageTransitionType.rightToLeft),
    );
  }

  _toRegisterPage() {
    // Navigator.pushReplacementNamed(context, '/register');
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
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus)
                          currentFocus.unfocus();
                        String e = _emailController.value.text;
                        String p = _passwordController.value.text;
                        _isShowErrorMessageEmail = e.isEmpty;
                        _isShowErrorMessagePassword = p.isEmpty;
                        if (e.isNotEmpty && p.isNotEmpty) {
                          _performLogin(context, e, p);
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
