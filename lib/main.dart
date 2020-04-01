import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supply_demand_covid19/ui/home/home.dart';
import 'package:supply_demand_covid19/ui/login/login.dart';
import 'package:supply_demand_covid19/ui/register/register.dart';
import 'package:supply_demand_covid19/ui/reset_password/reset_password.dart';
import 'package:supply_demand_covid19/ui/splashscreen/splashscreen.dart';
import 'package:supply_demand_covid19/ui/welcome/welcome.dart';

const String _appTitle = 'Covid-19 Supply Demand';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appTitle,
      theme: ThemeData(
        primaryColor: Color(0xFF055D8D),
      ),
      // onGenerateRoute: (RouteSettings settings) {
      //   switch (settings.name) {
      //     case '/welcome':
      //       return PageTransition(
      //           child: WelcomePage(), type: PageTransitionType.fade);
      //       break;
      //     case '/home':
      //       return PageTransition(
      //           child: HomePage(), type: PageTransitionType.fade);
      //       break;
      //     case '/login':
      //       return PageTransition(
      //           child: LoginPage(), type: PageTransitionType.rightToLeft);
      //       break;
      //     case '/register':
      //       return PageTransition(
      //           child: RegisterPage(), type: PageTransitionType.rightToLeft);
      //       break;
      //     case '/reset_password':
      //       return PageTransition(
      //           child: ResetPasswordPage(),
      //           type: PageTransitionType.rightToLeft);
      //       break;
      //     default:
      //       return PageTransition(child: MyHomePage(), type: null);
      //       break;
      //   }
      // },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
    return SplashscreenPage();
  }
}
