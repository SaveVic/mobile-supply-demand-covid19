import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _initialEmail = "";
  String _initialPassword = "";
  bool _isPasswordVisible = false;

  _performLogin(BuildContext context, String email, String password) {
    // implement later
  }

  @override
  Widget build(BuildContext context) {
    final _loginKey = GlobalKey<FormState>();
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
        padding: EdgeInsets.symmetric(vertical: 94, horizontal: 24),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/icon/icon_virus.png',
                    width: 27,
                    height: 27,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 41.5),
            Form(
              key: _loginKey,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9A9A9A),
                          letterSpacing: 6,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFF0F0F0),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(8.0),
                        // ),
                      ),
                      validator: (val) {
                        if (val.length == 0)
                          return "Email tidak boleh kosong";
                        else
                          return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                    ),
                  ),
                  SizedBox(height: 24.4),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9A9A9A),
                          letterSpacing: 6,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFF0F0F0),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 18,
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
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(8.0),
                        // ),
                        border: InputBorder.none,
                      ),
                      validator: (val) {
                        if (val.length == 0)
                          return "Password tidak boleh kosong";
                        else
                          return null;
                      },
                      obscureText: (_isPasswordVisible) ? false : true,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 13),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'Lupa Password?',
                textAlign: TextAlign.end,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 6,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            MaterialButton(
              minWidth: 313,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () {
                setState(() {
                  _saveData();
                  if (_loginKey.currentState.validate())
                    _performLogin(
                      context,
                      _emailController.value.text,
                      _passwordController.value.text,
                    );
                });
              },
              child: Text(
                'LOGIN',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 17,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Belum punya akun?\n',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9A9A9A),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 6,
                  ),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Daftar',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
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
