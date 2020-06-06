import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supply_demand_covid19/ui/dashboard/dashboard_admin/nav_account/page_account.dart';
import 'package:supply_demand_covid19/ui/dashboard/dashboard_admin/nav_input/page_input.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  int _selectedIndex = 0;
  final List<String> _appBarText = [
    'Alokasikan Bantuan',
    'Input Jenis Barang',
    'Akun'
  ];
  final List<String> _navBarText = ['Alokasi', 'Input', 'Akun'];
  final List<IconData> _navBarIcon = [
    Icons.card_giftcard,
    Icons.input,
    Icons.person
  ];
  final List<Widget> _bodyWidget = [
    Container(),
    AdminInputPage(),
    AdminAccountPage(),
  ];

  final _appBarStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: ScreenUtil().setSp(14),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      letterSpacing: 3,
    ),
  );

  final _navBarStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: ScreenUtil().setSp(10),
      fontStyle: FontStyle.normal,
      letterSpacing: 3,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarText[_selectedIndex],
          style: _appBarStyle,
        ),
        elevation: 0,
      ),
      body: _bodyWidget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xFF9A9A9A).withOpacity(0.5),
        elevation: 6,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: List<BottomNavigationBarItem>.generate(
          _navBarText.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(
              _navBarIcon[index],
              size: ScreenUtil().setWidth(24),
            ),
            title: Text(_navBarText[index], style: _navBarStyle),
          ),
        ),
      ),
    );
  }
}
