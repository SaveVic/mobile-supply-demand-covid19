import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supply_demand_covid19/resources/res_register.dart';
import 'package:supply_demand_covid19/ui/login/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _initialEmail = '';
  String _initialLembaga = '';
  String _initialPassword = '';
  String _initialConfirmPassword = '';
  String _pickedAccountType = account_type_list[0];
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isShowErrorMessageEmail = false;
  bool _isShowErrorMessageLembaga = false;
  bool _isShowErrorMessagePassword = false;
  bool _isShowErrorMessageConfirmPassword = false;

  _updateError(String email, String lembaga, String pass, String confirmPass) {
    _isShowErrorMessageEmail = email.isEmpty;
    _isShowErrorMessageLembaga = lembaga.isEmpty;
    _isShowErrorMessagePassword = pass.isEmpty;
    _isShowErrorMessageConfirmPassword = (confirmPass == pass);
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

  Widget _accountTypeSelector() => RadioButtonGroup(
        orientation: GroupedButtonsOrientation.HORIZONTAL,
        onSelected: (String selected) => setState(() {
          _pickedAccountType = selected;
        }),
        labels: account_type_list,
        picked: _pickedAccountType,
        activeColor: Theme.of(context).primaryColor,
        itemBuilder: (Radio rb, Text txt, int i) {
          String s = txt.data;
          return Row(
            children: <Widget>[
              rb,
              SizedBox(width: ScreenUtil().setWidth(7)),
              Text(
                s,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: normal_text_size,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: (s == _pickedAccountType)
                        ? Theme.of(context).primaryColor
                        : Color(color_label_hex),
                    letterSpacing: normal_letter_spacing,
                  ),
                ),
              ),
            ],
          );
        },
      );

  _performRegister(String email, String lembaga, String pass) {
    TODO:
    'implement register';
  }

  _toLoginPage() {
    Navigator.pushReplacement(
      context,
      PageTransition(child: LoginPage(), type: PageTransitionType.rightToLeft),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController =
        TextEditingController(text: _initialEmail);
    TextEditingController _lembagaController =
        TextEditingController(text: _initialLembaga);
    TextEditingController _passwordController =
        TextEditingController(text: _initialPassword);
    TextEditingController _confirmPasswordController =
        TextEditingController(text: _initialConfirmPassword);

    _saveData() {
      _initialEmail = _emailController.value.text;
      _initialLembaga = _lembagaController.value.text;
      _initialPassword = _passwordController.value.text;
      _initialConfirmPassword = _confirmPasswordController.value.text;
    }

    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(padding_vertical),
                bottom: ScreenUtil().setHeight(padding_vertical / 2),
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
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
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
                      lembaga_text,
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
                      controller: _lembagaController,
                    ),
                  ),
                  _showErrorMessageWidget(_isShowErrorMessageLembaga,
                      'Nama Lembaga tidak boleh kosong'),
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
                  SizedBox(height: ScreenUtil().setHeight(24.4)),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      confirm_password_text,
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
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                          child: Icon((_isConfirmPasswordVisible)
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: InputBorder.none,
                      ),
                      obscureText: (_isConfirmPasswordVisible) ? false : true,
                      keyboardType: TextInputType.text,
                      controller: _confirmPasswordController,
                    ),
                  ),
                  _showErrorMessageWidget(_isShowErrorMessageConfirmPassword,
                      'Konfirmasi Password harus sama dengan Password'),
                  SizedBox(height: ScreenUtil().setHeight(24.4)),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      account_type_text,
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
                    child: _accountTypeSelector(),
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
                        String l = _lembagaController.value.text;
                        String p = _passwordController.value.text;
                        String cp = _confirmPasswordController.value.text;
                        _updateError(e, l, p, cp);
                        if (e.isNotEmpty &&
                            l.isNotEmpty &&
                            p.isNotEmpty &&
                            p == cp) {
                          _performRegister(e, l, p);
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
                      text: login_title_text,
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
                          text: login_subtitle_text,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _toLoginPage(),
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
