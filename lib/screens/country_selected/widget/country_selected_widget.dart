import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tesy_app/bloc/search_bloc.dart';
import 'package:tesy_app/bloc/search_event.dart';
import 'package:tesy_app/bloc/search_state.dart';
import 'package:tesy_app/screens/const.dart';
import 'package:tesy_app/server/server.dart';

Widget searchWidget(BuildContext context) {
  return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
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
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: ConstSvgIcons().changeSizeAndColor(
                    ConstSvgIcons().leftArrow, Colors.white, 24.w, 24.h)),
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Column(children: <Widget>[
                Container(
                  width: 272.w,
                  height: 48.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: title1Controller,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: Colors.white, fontSize: 16.sp),
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
                                      color: Colors.grey, fontSize: 16.sp)),
                          onChanged: (text) {
                            bloc.add(OnChangeFirstSearchEvent(text: text));
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            bloc.add(OnSwapSerchEvent());
                          },
                          icon: ConstSvgIcons().changeSizeAndColor(
                              ConstSvgIcons().change,
                              Colors.white,
                              24.w,
                              24.h)),
                    ],
                  ),
                ),
                Container(
                  width: 272.w,
                  height: 1.h,
                  color: Colors.green,
                ),
                Container(
                  width: 272.w,
                  height: 48.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: title2Controller,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: Colors.white, fontSize: 16.sp),
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
                                      color: Colors.grey, fontSize: 16.sp)),
                          onChanged: (text) {
                            bloc.add(OnChangeSecondSearchEvent(text: text));
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            bloc.add(OnClearSecondSearchEvent());
                          },
                          icon: ConstSvgIcons().changeSizeAndColor(
                              ConstSvgIcons().close, Colors.white, 24.w, 24.h)),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  });
}

Widget listChips(BuildContext context,
    {required TextEditingController dateInput}) {
  return Padding(
    padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
    child: StatefulBuilder(builder: (context, setState) {
      return Container(
        height: 33.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: ActionChip(
                backgroundColor: Color(0xff2F3035),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff2F3035)),
                    borderRadius: BorderRadius.all(Radius.circular(50.r))),
                avatar: ConstSvgIcons().changeSizeAndColor(
                    ConstSvgIcons().plus, Colors.white, 16.w, 16.h),
                label: medium(
                    context: context,
                    title: 'Обратно',
                    color: Colors.white,
                    fontSizeT: 14.sp),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: ActionChip(
                backgroundColor: Color(0xff2F3035),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff2F3035)),
                    borderRadius: BorderRadius.all(Radius.circular(50.r))),
                label: RichText(
                    text: TextSpan(
                        text: dateInput.text,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white, fontSize: 14.sp),
                        children: [
                      TextSpan(
                          text: ", сб",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: Color(0xff9F9F9F), fontSize: 14.sp))
                    ])),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      locale: Locale('ru'),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd MMM', 'ru').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text = formattedDate;
                    });
                  } else {}
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: ActionChip(
                backgroundColor: Color(0xff2F3035),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff2F3035)),
                    borderRadius: BorderRadius.all(Radius.circular(50.r))),
                avatar: ConstSvgIcons().changeSizeAndColor(
                    ConstSvgIcons().human, Color(0xff5E5F61), 16.w, 16.h),
                label: medium(
                    context: context,
                    title: '1, эконом',
                    color: Colors.white,
                    fontSizeT: 14.sp),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: ActionChip(
                backgroundColor: Color(0xff2F3035),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff2F3035)),
                    borderRadius: BorderRadius.all(Radius.circular(50.r))),
                onPressed: () {},
                label: ConstSvgIcons().changeSizeAndColor(
                    ConstSvgIcons().filter, Colors.white, 16.w, 16.h),
              ),
            ),
          ],
        ),
      );
    }),
  );
}

Widget straightRails() {
  return Container(
    width: 328.w,
    decoration: BoxDecoration(
        color: Color(0xff1D1E20),
        borderRadius: BorderRadius.all(Radius.circular(16.r))),
    child: Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 6.h, right: 16.w, left: 16.w),
      child: FutureBuilder(
          future: StudyNetApiClient().getTicketsOffers(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semibold(
                      context: context,
                      title: "Прямые рельсы",
                      color: Colors.white,
                      fontSizeT: 20.sp),
                  Column(
                      children: snapshot.data!.ticketsOffers.map(
                    (e) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Container(
                          width: 296.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.h, color: Colors.green),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            leading: Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: CircleAvatar(
                                radius: 12.r,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  e.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: Colors.white, fontSize: 14.sp),
                                )),
                                Container(
                                  margin: EdgeInsets.only(
                                      right:
                                          16), // Adjust the spacing as needed
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${e.price.value} ₽',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color: Color(0xff2261BC),
                                                fontSize: 14.sp),
                                      ),
                                      ConstSvgIcons().changeSizeAndColor(
                                          ConstSvgIcons().rightArrow,
                                          Color(0xff2261BC),
                                          16.w,
                                          16.h),
                                    ],
                                  ), // Trailing content
                                ),
                              ],
                            ),
                            subtitle: Text(
                              e.timeRange.join(" "),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.white, fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList()),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 42.h,
                      width: 328.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.r))),
                      child: Center(
                        child: Text(
                          "Показать все",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Color(0xff2261BC), fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ]);
          }),
    ),
  );
}
