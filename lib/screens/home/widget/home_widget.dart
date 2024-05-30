import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesy_app/bloc/search_bloc.dart';
import 'package:tesy_app/bloc/search_event.dart';
import 'package:tesy_app/bloc/search_state.dart';
import 'package:tesy_app/screens/const.dart';
import 'package:tesy_app/screens/country_selected/country_selected_page.dart';
import 'package:tesy_app/screens/empty_page.dart';
import 'package:tesy_app/server/server.dart';

Widget searchWidget(BuildContext context) {
  return SliverToBoxAdapter(
    child: Center(
      child: Container(
        width: 328.w,
        height: 128.h,
        decoration: BoxDecoration(
            color: Color(0xff2F3035),
            borderRadius: BorderRadius.all(Radius.circular(16.r))),
        child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
          final bloc = context.read<SearchBloc>();

          TextEditingController title1Controller =
              TextEditingController(text: state.text1);
          title1Controller.value = title1Controller.value.copyWith(
              text: bloc.state.text1,
              selection: TextSelection.fromPosition(
                  TextPosition(offset: bloc.state.text1.length)));

          TextEditingController title2Controller =
              TextEditingController(text: state.text2);
          title2Controller.value = title2Controller.value.copyWith(
              text: bloc.state.text2,
              selection: TextSelection.fromPosition(
                  TextPosition(offset: bloc.state.text2.length)));
          return Center(
            child: Container(
              width: 296.w,
              height: 91.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 74, 75, 80),
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green,
                    spreadRadius: -5,
                    blurRadius: 10,
                    offset: Offset(-1, 10), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: ConstSvgIcons().changeSizeAndColor(
                        ConstSvgIcons().search, Colors.grey, 24.w, 24.h),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Column(children: <Widget>[
                      Container(
                        width: 229.w,
                        height: 45.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: title1Controller,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: Colors.white, fontSize: 16.sp),
                                textAlign: TextAlign.start,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[а-яА-Я]'))
                                ],
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Откуда - Москва",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            color: Colors.grey,
                                            fontSize: 16.sp)),
                                onChanged: (text) {
                                  print(text);
                                  bloc.add(
                                      OnChangeFirstSearchEvent(text: text));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 229.w,
                        height: 1.h,
                        color: Colors.green,
                      ),
                      Container(
                        width: 229.w,
                        height: 45.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: title2Controller,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        color: Colors.white, fontSize: 16.sp),
                                textAlign: TextAlign.start,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[а-яА-Я]'))
                                ],
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Куда - Турция",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            color: Colors.grey,
                                            fontSize: 16.sp)),
                                onTap: () {
                                  serchPage(context);
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => SearchPage()));
                                },
                                onChanged: (text) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    ),
  );
}

defutLits(BuildContext context, {double pRight = 50}) {
  return SliverToBoxAdapter(
    child: Container(
      height: 213.h,
      width: 132.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: pRight),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  width: 132.w,
                  height: 132.h,
                  decoration: BoxDecoration(
                      color: Color(0xff2F3035),
                      borderRadius: BorderRadius.all(Radius.circular(16.r))),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 132.w,
                  child: Text(
                    "Погреться в грязевых источниках",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
                Text(
                  "Будапешт",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white, fontSize: 14.sp),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.grey,
                      size: 24.w,
                    ),
                    Text(
                      "от 22 264 ₽",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white, fontSize: 14.sp),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    ),
  );
}

Widget musicWidget() {
  return SliverToBoxAdapter(
    child: Container(
      height: 213.h,
      width: 132.w,
      child: FutureBuilder(
        future: StudyNetApiClient().getOffers(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.offers.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Wrap(direction: Axis.vertical, children: [
                    Container(
                      width: 132.w,
                      height: 132.h,
                      decoration: BoxDecoration(
                          color: Color(0xff2F3035),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Center(
                        child: Text(
                          e.id.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 132.w,
                      child: Text(
                        e.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                    Text(
                      e.town,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white, fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 24.w,
                        ),
                        Text(
                          "от ${e.price.value} ₽",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white, fontSize: 14.sp),
                        )
                      ],
                    )
                  ]),
                );
              }).toList(),
            );
          }
        },
      ),
    ),
  );
}

serchPage(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Color(0xff242529),
      builder: (context) {
        return FractionallySizedBox(
            heightFactor: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  height: 5.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      color: Color(0xff5E5F61),
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                ),
                SizedBox(
                  height: 24.h,
                ),
                BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                  final bloc = context.read<SearchBloc>();

                  TextEditingController title1Controller =
                      TextEditingController(text: state.text1);
                  title1Controller.value = title1Controller.value.copyWith(
                      text: bloc.state.text1,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: bloc.state.text1.length)));

                  TextEditingController title2Controller =
                      TextEditingController(text: state.text2);
                  title2Controller.value = title2Controller.value.copyWith(
                      text: bloc.state.text2,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: bloc.state.text2.length)));
                  return Center(
                    child: Container(
                      height: 97.h,
                      width: 328.w,
                      decoration: BoxDecoration(
                          color: Color(0xff2F3035),
                          borderRadius: BorderRadius.all(Radius.circular(8.r))),
                      child: Column(children: <Widget>[
                        Container(
                          width: 298.w,
                          height: 48.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                icon: ConstSvgIcons().changeSizeAndColor(
                                    ConstSvgIcons().samolet,
                                    Colors.white,
                                    24.w,
                                    24.h),
                                onPressed: () => {},
                              ),
                              Padding(padding: EdgeInsets.only(left: 20.0)),
                              Expanded(
                                child: TextField(
                                  controller: title1Controller,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          color: Colors.white, fontSize: 16.sp),
                                  textAlign: TextAlign.start,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[а-яА-Я]'))
                                  ],
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Откуда - Москва",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: Colors.grey,
                                              fontSize: 16.sp)),
                                  onChanged: (text) {
                                    bloc.add(
                                        OnChangeFirstSearchEvent(text: text));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 298.w,
                          height: 1.h,
                          color: Colors.green,
                        ),
                        Container(
                          width: 298.w,
                          height: 48.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                icon: ConstSvgIcons().changeSizeAndColor(
                                    ConstSvgIcons().search,
                                    Colors.white,
                                    24.w,
                                    24.h),
                                onPressed: () => {},
                              ),
                              Padding(padding: EdgeInsets.only(left: 20.0)),
                              Expanded(
                                child: TextField(
                                  controller: title2Controller,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          color: Colors.white, fontSize: 16.sp),
                                  textAlign: TextAlign.start,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[а-яА-Я]'))
                                  ],
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Куда - Турция",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: Colors.grey,
                                              fontSize: 16.sp)),
                                  onChanged: (text) {
                                    bloc.add(
                                        OnChangeSecondSearchEvent(text: text));
                                  },
                                ),
                              ),
                              IconButton(
                                icon: ConstSvgIcons().changeSizeAndColor(
                                    ConstSvgIcons().close,
                                    Colors.white,
                                    24.w,
                                    24.h),
                                onPressed: () {
                                  bloc.add(OnClearSecondSearchEvent());
                                },
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17.w, bottom: 30.h),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EmptyPage()));
                          },
                          child: Container(
                            width: 70.w,
                            height: 90.h,
                            child: Column(
                              children: [
                                Container(
                                    width: 48.w,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.r)),
                                      color: Color(0xff4CB24E),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.w),
                                      child: ConstSvgIcons().changeSizeAndColor(
                                          ConstSvgIcons().route,
                                          Colors.white,
                                          24.w,
                                          24.h),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: regular(
                                    context: context,
                                    title: "Cложный маршрут",
                                    color: Colors.white,
                                    fontSizeT: 14.sp,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<SearchBloc>()
                                .add(OnButtomPressEvent());
                          },
                          child: Container(
                            width: 79.w,
                            height: 73.h,
                            child: Column(
                              children: [
                                Container(
                                    width: 48.w,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.r)),
                                      color: Color(0xff4C95FE),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.w),
                                      child: ConstSvgIcons().changeSizeAndColor(
                                          ConstSvgIcons().ball,
                                          Colors.white,
                                          24.w,
                                          24.h),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: regular(
                                    context: context,
                                    title: "Куда угодно",
                                    color: Colors.white,
                                    fontSizeT: 14.sp,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Container(
                          width: 64.w,
                          height: 73.h,
                          child: Column(
                            children: [
                              Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r)),
                                    color: Color(0xff00427D),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.w),
                                    child: ConstSvgIcons().changeSizeAndColor(
                                        ConstSvgIcons().calendar,
                                        Colors.white,
                                        24.w,
                                        24.h),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: regular(
                                  context: context,
                                  title: "Выходные",
                                  color: Colors.white,
                                  fontSizeT: 14.sp,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Container(
                          width: 65.w,
                          height: 90.h,
                          child: Column(
                            children: [
                              Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r)),
                                    color: Color(0xffFF0000),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.w),
                                    child: ConstSvgIcons().changeSizeAndColor(
                                        ConstSvgIcons().fire,
                                        Colors.white,
                                        24.w,
                                        24.h),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: regular(
                                  context: context,
                                  title: "Выходные",
                                  color: Colors.white,
                                  fontSizeT: 14.sp,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 328.w,
                  height: 216.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.r),
                      ),
                      color: Color(0xff2F3035)),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CountrySelectedPage()));
                          },
                          child: Container(
                            width: 296.w,
                            height: 56.h,
                            child: ListTile(
                              leading: Container(
                                width: 40.w,
                                height: 40.h,
                                color: Colors.amber,
                              ),
                              title: semibold(
                                  context: context,
                                  title: "Стамбул",
                                  color: Colors.white,
                                  fontSizeT: 16.sp),
                              subtitle: regular(
                                  context: context,
                                  title: "Популярное направление",
                                  color: Color(0xff5E5F61),
                                  fontSizeT: 14.sp),
                            ),
                          ),
                        ),
                        Container(
                          width: 270.w,
                          height: 1.h,
                          color: Colors.green,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CountrySelectedPage()));
                          },
                          child: Container(
                            width: 296.w,
                            height: 56.h,
                            child: ListTile(
                              leading: Container(
                                width: 40.w,
                                height: 40.h,
                                color: Colors.amber,
                              ),
                              title: semibold(
                                  context: context,
                                  title: "Стамбул",
                                  color: Colors.white,
                                  fontSizeT: 16.sp),
                              subtitle: regular(
                                  context: context,
                                  title: "Популярное направление",
                                  color: Color(0xff5E5F61),
                                  fontSizeT: 14.sp),
                            ),
                          ),
                        ),
                        Container(
                          width: 270.w,
                          height: 1.h,
                          color: Colors.green,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CountrySelectedPage()));
                          },
                          child: Container(
                            width: 296.w,
                            height: 56.h,
                            child: ListTile(
                              leading: Container(
                                width: 40.w,
                                height: 40.h,
                                color: Colors.amber,
                              ),
                              title: semibold(
                                  context: context,
                                  title: "Стамбул",
                                  color: Colors.white,
                                  fontSizeT: 16.sp),
                              subtitle: regular(
                                  context: context,
                                  title: "Популярное направление",
                                  color: Color(0xff5E5F61),
                                  fontSizeT: 14.sp),
                            ),
                          ),
                        ),
                        Container(
                          width: 270.w,
                          height: 1.h,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      });
}
