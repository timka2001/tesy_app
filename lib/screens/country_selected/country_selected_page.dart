import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tesy_app/bloc/search_bloc.dart';
import 'package:tesy_app/bloc/search_event.dart';
import 'package:tesy_app/bloc/search_state.dart';
import 'package:tesy_app/screens/const.dart';
import 'package:tesy_app/screens/country_selected/widget/country_selected_widget.dart';
import 'package:tesy_app/screens/ticket_page.dart';
import 'package:tesy_app/screens/tickets_page.dart';
import 'package:tesy_app/server/server.dart';

class CountrySelectedPage extends StatefulWidget {
  @override
  State<CountrySelectedPage> createState() => _MyCountrySelectedPageState();
}

class _MyCountrySelectedPageState extends State<CountrySelectedPage> {
  TextEditingController dateInput = TextEditingController(text: "23 ,фев");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        child: Column(children: [
          SizedBox(
            height: 48.h,
          ),
          searchWidget(context),
          listChips(context, dateInput: dateInput),
          straightRails(),
          SizedBox(
            height: 23.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyTicketsPage()));
            },
            child: Container(
              height: 42.h,
              width: 328.w,
              decoration: BoxDecoration(
                  color: Color(0xff2261BC),
                  borderRadius: BorderRadius.all(Radius.circular(8.r))),
              child: Center(
                child: Text(
                  "Посмотреть все билеты",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          GestureDetector(
            child: Container(
              height: 51.h,
              width: 328.w,
              decoration: BoxDecoration(
                  color: Color(0xff2F3035),
                  borderRadius: BorderRadius.all(Radius.circular(8.r))),
              child: ListTile(
                leading: ConstSvgIcons().changeSizeAndColor(
                    ConstSvgIcons().notifications, Colors.white, 28.w, 28.h),
                title: Text(
                  "Подписка на цену",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white, fontSize: 16.sp),
                ),
                trailing: Container(
                  width: 36.w,
                  height: 20.h,
                  child: Switch(
                    activeTrackColor: Colors.red,
                    value: false,
                    onChanged: (bool value) {},
                  ),
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
