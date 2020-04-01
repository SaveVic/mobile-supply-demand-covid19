import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supply_demand_covid19/resources/res_login.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String _initialEmail = "";
  bool _isShowErrorMessageEmail = false;

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

  _performReset(String email) {
    TODO:
    'implement reset password';
    Fluttertoast.showToast(
        msg: 'Berhasil reset password', toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController =
        TextEditingController(text: _initialEmail);

    _saveData() {
      _initialEmail = _emailController.value.text;
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
                          'Reset Password',
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
                        _isShowErrorMessageEmail = e.isEmpty;
                        if (e.isNotEmpty) {
                          _performReset(e);
                        }
                      });
                    },
                    child: Text(
                      'RESET',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
