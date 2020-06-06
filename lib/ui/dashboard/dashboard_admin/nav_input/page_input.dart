import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supply_demand_covid19/database/barang_helper/barang_helper.dart';
import 'package:supply_demand_covid19/ui/dashboard/dashboard_admin/nav_input/table_barang.dart';

class AdminInputPage extends StatefulWidget {
  @override
  _AdminInputPageState createState() => _AdminInputPageState();
}

class _AdminInputPageState extends State<AdminInputPage> {
  List<JenisBarang> _jenisBarang;
  int startIndex = 1;
  int rowCount = 10;
  String _inputBarangText = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController _barangController =
        TextEditingController(text: _inputBarangText);

    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(ScreenUtil().setWidth(23)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nama Barang',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF9A9A9A),
                  letterSpacing: 3,
                )),
              ),
              SizedBox(height: ScreenUtil().setHeight(15)),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFFF0F0F0),
                ),
                child: TextFormField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      letterSpacing: 3,
                    ),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  controller: _barangController,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(24.5)),
              MaterialButton(
                minWidth: ScreenUtil().setWidth(312),
                color: Theme.of(context).primaryColor,
                padding:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8)),
                ),
                onPressed: () async {
                  String temp = _barangController.value.text;
                  if (temp.isNotEmpty) {
                    // await JenisBarangDBHelper.dbHelper
                    //     .insert(JenisBarang(temp));

                    _inputBarangText = '';
                    setState(() {
                      startIndex = 1;
                    });
                  }
                },
                child: Text(
                  'TAMBAH',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(16),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(56)),
              Text(
                'Database Jenis Barang',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B3F44),
                  letterSpacing: 3,
                )),
              ),
              SizedBox(height: ScreenUtil().setHeight(24)),
              FutureBuilder(
                  future: JenisBarangDBHelper.dbHelper.selectAll(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _jenisBarang = snapshot.data;
                      int len =
                          min(rowCount, _jenisBarang.length - startIndex + 1);
                      return AdminTableBarang(
                        width: ScreenUtil().setWidth(312),
                        rowCount: rowCount,
                        startIndex: startIndex,
                        listItem: List<JenisBarang>.generate(len,
                            (index) => _jenisBarang[startIndex + index - 1]),
                        activePrev: (startIndex > 1),
                        activeNext:
                            (startIndex + rowCount - 1 < _jenisBarang.length),
                        onDeleteItem: (ind) async {
                          await JenisBarangDBHelper.dbHelper.delete(ind);
                          _inputBarangText = _barangController.value.text;
                          setState(() {
                            startIndex = 1;
                          });
                        },
                        onPrev: () {
                          _inputBarangText = _barangController.value.text;
                          setState(() {
                            startIndex = max(startIndex - rowCount, 1);
                          });
                        },
                        onNext: () {
                          _inputBarangText = _barangController.value.text;
                          setState(() {
                            startIndex =
                                min(_jenisBarang.length, startIndex + rowCount);
                          });
                        },
                      );
                    } else {
                      return Container();
                    }
                  }),
            ],
          ),
        )
      ],
    );
  }
}
