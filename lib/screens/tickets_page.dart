import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesy_app/screens/const.dart';
import 'package:tesy_app/screens/ticket_page.dart';

import 'package:intl/intl.dart';
import 'package:tesy_app/server/server.dart';

class MyTicketsPage extends StatelessWidget {
  MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 37.h,
                ),
                child: Center(
                  child: Container(
                    width: 323.w,
                    height: 56.h,
                    color: Color(0xff242529),
                    child: ListTile(
                      title: Text("Москва-Сочи",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white, fontSize: 16)),
                      subtitle: Text("23 февраля, 1 пассажир",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.grey, fontSize: 14)),
                      leading: IconButton(
                        icon: ConstSvgIcons().changeSizeAndColor(
                            ConstSvgIcons().leftArrow,
                            Color(0xff00427D),
                            24.w,
                            24.h),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                future: StudyNetApiClient().getTickets(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                    children: snapshot.data!.tickets.map((e) {
                      double hour = 0.0;
                      if (e.arrival.date.hour > e.departure.date.hour) {
                        hour = (e.arrival.date.hour - e.departure.date.hour)
                            .toDouble();
                      } else {
                        if (e.arrival.date.hour == 0) {
                          hour = (24 - e.departure.date.hour).toDouble();
                        }
                      }

                      double minuts = 0.0;
                      if (e.arrival.date.minute - e.departure.date.minute > 0) {
                        hour += 0.5;
                      } else {
                        hour -= 0.5;
                      }

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TicketPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Container(
                                      width: 328.w,
                                      height: 119.h,
                                      decoration: BoxDecoration(
                                          color: Color(0xff1D1E20),
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
                                            8.w,
                                          ))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 13.w,
                                              bottom: 8.h,
                                              top: 21.h,
                                            ),
                                            child: Text(
                                                "${e.price.value.toString()} ₽",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 22.sp)),
                                          ),
                                          ListTile(
                                            leading: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 14.w),
                                              child: CircleAvatar(
                                                radius: 12.r,
                                                backgroundColor: Colors.red,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.all(0),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "${DateFormat('kk:mm').format(e.departure.date)}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium!
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp),
                                                      children: [
                                                        TextSpan(
                                                            text: " - ",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium!
                                                                .copyWith(
                                                                    color: Color(
                                                                        0xff9F9F9F),
                                                                    fontSize:
                                                                        14.sp)),
                                                        TextSpan(
                                                            text:
                                                                "${DateFormat('kk:mm ').format(e.arrival.date)}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.sp)),
                                                      ]),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right:
                                                          16), // Adjust the spacing as needed
                                                  child: Expanded(
                                                    child: Text(
                                                      '${hour}ч в пути / Без пересадок',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall!
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp),
                                                    ),
                                                  ), // Trailing content
                                                ),
                                              ],
                                            ),
                                            subtitle: Text(
                                              "${e.departure.airport}      ${e.arrival.airport}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!
                                                  .copyWith(
                                                      color: Color(0xff9F9F9F),
                                                      fontSize: 14.sp),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                e.badge != null
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          left: 14.w,
                                        ),
                                        child: Container(
                                          height: 20.h,
                                          width: 126.w,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Center(
                                              child: Text(
                                            e.badge.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 14.w,
                                                ),
                                          )),
                                        ),
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ))
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 203.w,
              height: 37.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  color: Colors.blue),
              child: Row(
                children: [
                  Container(
                    width: 100.w,
                    height: 37.h,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: ConstSvgIcons().changeSizeAndColor(
                          ConstSvgIcons().filter, Colors.white, 16.w, 16.h),
                      title: Text(
                        "Фильтр",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  Container(
                    width: 95.w,
                    height: 37.h,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: ConstSvgIcons().changeSizeAndColor(
                          ConstSvgIcons().schedule, Colors.white, 16.w, 16.h),
                      title: Text(
                        "График цен",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}






//  return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(bottom: reSizer(37, context)),
//                 child: Center(
//                   child: Container(
//                     width: reSizer(300, context),
//                     height: reSizer(56, context),
//                     color: Color(0xff242529),
//                     child: ListTile(
//                       title: Text("Москва-Сочи",
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline4!
//                               .copyWith(color: Colors.white, fontSize: 16)),
//                       subtitle: Text("23 февраля, 1 пассажир",
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline1!
//                               .copyWith(color: Colors.grey, fontSize: 14)),
//                       leading: Icon(
//                         Icons.abc,
//                         color: Color(0xff00427D),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                   child: FutureBuilder(
//                 future: StudyNetApiClient().getTickets(),
//                 builder: (context, snapshot) {
//                   if (snapshot.data == null) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   return ListView(
//                     children: snapshot.data!.tickets.map((e) {
//                       return Padding(
//                         padding: EdgeInsets.only(
//                             right: reSizer(17, context),
//                             left: reSizer(17, context),
//                             bottom: reSizer(24, context)),
//                         child: Stack(
//                           children: [
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(top: reSizer(6, context)),
//                               child: Container(
//                                 width: reSizer(323, context),
//                                 height: reSizer(119, context),
//                                 decoration: BoxDecoration(
//                                     color: Color(0xff1D1E20),
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(reSizer(8, context)))),
//                                 child: Padding(
//                                   padding: EdgeInsets.only(
//                                     left: reSizer(16, context),
//                                     top: reSizer(16, context),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                             bottom: reSizer(16, context)),
//                                         child: Text("6 990 ₽",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .headline3!
//                                                 .copyWith(
//                                                     color: Colors.white,
//                                                     fontSize: 22)),
//                                       ),
//                                       Container(
//                                         height: 60,
//                                         width: reSizer(330, context),
//                                         color: Colors.red,
//                                         child: Wrap(
//                                           direction: Axis.vertical,
//                                           alignment: WrapAlignment
//                                               .start, // Added for vertical alignment
//                                           crossAxisAlignment: WrapCrossAlignment
//                                               .start, // Added for vertical alignment
//                                           // Add the width constraint here
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   top: 8, right: 8, bottom: 8),
//                                               child: Container(
//                                                   color: Colors.white,
//                                                   child: Icon(Icons
//                                                       .abc)), // Corrected the icon name
//                                             ),
//                                             Container(
//                                               width: reSizer(280,
//                                                   context), // Add the width constraint here
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment
//                                                         .start, // Added for vertical alignment
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Flexible(
//                                                         child: RichText(
//                                                           text: TextSpan(
//                                                               text:
//                                                                   "${DateFormat('kk:mm ').format(e.departure.date)}",
//                                                               style: Theme.of(
//                                                                       context)
//                                                                   .textTheme
//                                                                   .headline1!
//                                                                   .copyWith(
//                                                                       color: Colors
//                                                                           .white,
//                                                                       fontSize:
//                                                                           reSizer(
//                                                                               12,
//                                                                               context)),
//                                                               children: [
//                                                                 TextSpan(
//                                                                     text: "-",
//                                                                     style: Theme.of(
//                                                                             context)
//                                                                         .textTheme
//                                                                         .headline1!
//                                                                         .copyWith(
//                                                                             color:
//                                                                                 Color(0xff9F9F9F),
//                                                                             fontSize: reSizer(12, context))),
//                                                                 TextSpan(
//                                                                     text:
//                                                                         "${DateFormat(' kk:mm').format(e.arrival.date)}",
//                                                                     style: Theme.of(
//                                                                             context)
//                                                                         .textTheme
//                                                                         .headline1!
//                                                                         .copyWith(
//                                                                             color:
//                                                                                 Colors.white,
//                                                                             fontSize: reSizer(12, context))),
//                                                               ]),
//                                                         ),
//                                                       ),
//                                                       Expanded(
//                                                         child: Align(
//                                                           alignment: Alignment
//                                                               .centerRight,
//                                                           child: Text(
//                                                             "3.5ч в пути / Без пересaдок",
//                                                             maxLines: 1,
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .headline2!
//                                                                 .copyWith(
//                                                                     color: Color(
//                                                                         0xff9F9F9F),
//                                                                     fontSize:
//                                                                         reSizer(
//                                                                             12,
//                                                                             context)),
//                                                           ),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   Container(
//                                                     width:
//                                                         reSizer(240, context),
//                                                     child: Text(
//                                                       "${e.departure.airport}      ${e.arrival.airport}",
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .headline2!
//                                                           .copyWith(
//                                                               color: Color(
//                                                                   0xff9F9F9F),
//                                                               fontSize: reSizer(
//                                                                   14, context)),
//                                                       maxLines: 1,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             e.badge != null
//                                 ? Padding(
//                                     padding: EdgeInsets.only(
//                                         left: reSizer(16, context)),
//                                     child: Container(
//                                       height: reSizer(20, context),
//                                       width: reSizer(126, context),
//                                       decoration: BoxDecoration(
//                                           color: Colors.blue,
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20))),
//                                       child: Center(
//                                           child: Text(
//                                         e.badge.toString(),
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline1!
//                                             .copyWith(
//                                                 color: Colors.white,
//                                                 fontSize: reSizer(14, context)),
//                                       )),
//                                     ),
//                                   )
//                                 : Text(''),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 },
//               ))
//             ],
//           ),
//         ));


// Stack(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                     right: reSizer(17, context),
//                     left: reSizer(17, context),
//                   ),
//                   child: Container(
//                     width: reSizer(323, context),
//                     height: reSizer(119, context),
//                     decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(reSizer(8, context)))),
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           left: reSizer(16, context),
//                           top: reSizer(16, context),
//                           right: reSizer(4, context)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(bottom: reSizer(16, context)),
//                             child: Text("data"),
//                           ),
//                           Container(
//                             height: 60,
//                             width: reSizer(323, context),
//                             color: Colors.red,
//                             child: Wrap(
//                               direction: Axis.vertical,
//                               alignment: WrapAlignment
//                                   .start, // Added for vertical alignment
//                               crossAxisAlignment: WrapCrossAlignment
//                                   .start, // Added for vertical alignment
//                               // Add the width constraint here
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(8),
//                                   child: Container(
//                                       color: Colors.white,
//                                       child: Icon(Icons
//                                           .abc)), // Corrected the icon name
//                                 ),
//                                 Container(
//                                   width: reSizer(280,
//                                       context), // Add the width constraint here
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment
//                                         .start, // Added for vertical alignment
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Flexible(
//                                             child: Text("data datadatadata"),
//                                           ),
//                                           Expanded(
//                                             child: Align(
//                                               alignment: Alignment.centerRight,
//                                               child: Text("data"),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       Container(
//                                         width: reSizer(240, context),
//                                         child: Text(
//                                           "mmmm mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),










// Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CustomPaint(
//                 painter: ExampleLine(xaxis: 100, yaxis: 100),
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.black,
//                   child: Text("This is the custom painter for arrow down curve",
//                       style: TextStyle(
//                         color: Colors.black,
//                       )),
//                 ),
//               ),
//             ),
// class ExampleLine extends CustomPainter {
//   double xaxis, yaxis;
//   ExampleLine({required this.xaxis, required this.yaxis});
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint line = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
//     Path pline = Path();
//     pline.moveTo(-size.width / 8, yaxis / 2);
//     pline.lineTo(0, yaxis / 4);
//     pline.lineTo(0, (yaxis * 3) / 4);
//     pline.close();

//     canvas.drawPath(pline, line);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }



// Padding(
//         padding: const EdgeInsets.all(50),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     CircleAvatar(radius: 20, backgroundColor: Colors.amber),
          //     CircleAvatar(radius: 7, backgroundColor: Colors.white),
          //   ],
          // ),
          // Container(
          //   width: 5,
          //   height: 50,
          //   color: Colors.amber,
          // ),
          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     CircleAvatar(radius: 20, backgroundColor: Colors.amber),
          //     CircleAvatar(radius: 10, backgroundColor: Colors.white),
          //   ],
          // ),
//         ]),
//       ),
