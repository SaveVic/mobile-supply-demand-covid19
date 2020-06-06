import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supply_demand_covid19/database/barang_helper/barang_helper.dart';

class AdminTableBarang extends StatelessWidget {
  final double width;
  final int rowCount;
  final int startIndex;
  final List<JenisBarang> listItem;
  final bool activePrev, activeNext;
  final Function(String) onDeleteItem;
  final Function onNext, onPrev;

  const AdminTableBarang(
      {Key key,
      this.width,
      this.rowCount,
      this.startIndex,
      this.listItem,
      this.activePrev,
      this.activeNext,
      this.onDeleteItem,
      this.onNext,
      this.onPrev})
      : super(key: key);

  Widget _listContent() => (listItem.isNotEmpty)
      ? Container(
          child: Column(
            children: List<Widget>.generate(
              listItem.length,
              (index) => Container(
                height: ScreenUtil().setHeight(40),
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(10),
                  right: ScreenUtil().setWidth(19),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF9A9A9A),
                    width: 1.0,
                  ),
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(48),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${index + startIndex}',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        listItem[index].nama,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onDeleteItem(listItem[index].id),
                      child: Icon(
                        Icons.delete,
                        size: ScreenUtil().setWidth(20),
                        color: Color(0xFF9A9A9A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      : Container();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(40),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF9A9A9A),
                width: 1.0,
              ),
              color: Theme.of(context).primaryColor,
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(48),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'No',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Nama Barang',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _listContent(),
          SizedBox(height: ScreenUtil().setHeight(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (activePrev) onPrev();
                },
                child: Icon(
                  Icons.navigate_before,
                  size: ScreenUtil().setWidth(24),
                  color: (activePrev)
                      ? Theme.of(context).primaryColor
                      : Color(0xFF9A9A9A),
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Baris per halaman :',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(17)),
                    Container(
                      height: ScreenUtil().setHeight(34),
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(13)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(8)),
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '$rowCount',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          Icon(
                            Icons.expand_more,
                            size: ScreenUtil().setWidth(24),
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (activeNext) onNext();
                },
                child: Icon(
                  Icons.navigate_next,
                  size: ScreenUtil().setWidth(24),
                  color: (activeNext)
                      ? Theme.of(context).primaryColor
                      : Color(0xFF9A9A9A),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
