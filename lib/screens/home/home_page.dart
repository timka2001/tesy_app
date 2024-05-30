import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesy_app/screens/const.dart';
import 'package:tesy_app/screens/home/widget/home_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: CustomScrollView(
          shrinkWrap: true,
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: semibold(
                  title: "Поиск дешевых авиабилетов",
                  context: context,
                  color: Color(0xffD9D9D9),
                  fontSizeT: 22.sp,
                  isCenter: true),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 62.h),
            ),
            searchWidget(context),
            SliverToBoxAdapter(
              child: SizedBox(height: 32.h),
            ),
            SliverToBoxAdapter(
              child: semibold(
                title: "Музыкально отлететь",
                context: context,
                color: Colors.white,
                fontSizeT: 22.sp,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 25.h),
            ),
            musicWidget(),
            SliverToBoxAdapter(
              child: SizedBox(height: 16.h),
            ),
            SliverToBoxAdapter(
              child: Center(
                  child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 42.h,
                  width: 328.w,
                  decoration: const BoxDecoration(
                      color: Color(0xff2F3035),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: semibold(
                      title: "Показать все места",
                      context: context,
                      color: Colors.white,
                      fontSizeT: 16.sp,
                      isCenter: true),
                ),
              )),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 32.h),
            ),
            SliverToBoxAdapter(
              child: semibold(
                title: "Ваш первый раз",
                context: context,
                color: Colors.white,
                fontSizeT: 22.sp,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 16.h),
            ),
            defutLits(context, pRight: 16.w),
            SliverToBoxAdapter(
              child: SizedBox(height: 16.h),
            ),
            SliverToBoxAdapter(
              child: Center(
                  child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 42.h,
                  width: 328.w,
                  decoration: const BoxDecoration(
                      color: Color(0xff2F3035),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: semibold(
                      title: "Показать все места",
                      context: context,
                      color: Colors.white,
                      fontSizeT: 16.sp,
                      isCenter: true),
                ),
              )),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 32.h),
            ),
          ],
        ),
      )),
    );
  }
}

//  child: title(
//               title: "Поиск дешевых авиабилетов",
//               context: context, color: Colors.white,
//              ),


//https://stackoverflow.com/questions/77070978/flutter-add-a-stroke-to-a-text-widget
//Не нашел как нормально можно отобразить text по макету,
//с этой проблемоой сталкивались и другие пользователи комюнити,
//поэтому оставил ссылку,если у Вас есть другой способ,то буду рад узнать его)
// Widget title2({
//   required String title,
//   required BuildContext context,
//   required double fontSize,
//   required fontWeight,
//   required color,
//   required Color strokeColor,
//   required double strokeWidth,
// }) {
//   return Stack(
//     children: [
//       Text(
//         title,
//         style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//               fontSize: fontSize,
//               fontWeight: fontWeight,
//               foreground: Paint()..color = color,
//             ),
//       ),
//       Text(
//         title,
//         style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//               fontSize: fontSize,
//               fontWeight: fontWeight,
//               foreground: Paint()
//                 ..strokeWidth = strokeWidth
//                 ..color = strokeColor
//                 ..style = PaintingStyle.stroke,
//             ),
//       ),
//     ],
//   );
// }
// child: title2(
//                 title: "Поиск дешевых авиабилетов",
//                 context: context,
//                 fontSize: 22,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.white,
//                 strokeColor: Colors.white,
//                 strokeWidth: 1),




// Container(
//               height: 97.h,
//               width: 328.w,
//               decoration: BoxDecoration(
//                   color: Color(0xff2F3035),
//                   borderRadius: BorderRadius.all(Radius.circular(8.r))),
//               child: Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.abc,
//                         color: Colors.white,
//                       )),
//                   Padding(
//                     padding: EdgeInsets.only(right: 8.w),
//                     child: Column(children: <Widget>[
//                       Container(
//                         width: 272.w,
//                         height: 48.h,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(
//                                 Icons.abc,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () => {},
//                             ),
//                             Padding(padding: EdgeInsets.only(left: 20.0)),
//                             Expanded(
//                               child: TextField(
//                                 textAlign: TextAlign.start,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'[а-яА-Я]'))
//                                 ],
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Откуда - Москва",
//                                     hintStyle: Theme.of(context)
//                                         .textTheme
//                                         .displayLarge!
//                                         .copyWith(
//                                             color: Colors.grey,
//                                             fontSize: 16.sp)),
//                                 onChanged: (text) {},
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 250.w,
//                         height: 1.h,
//                         color: Colors.green,
//                       ),
//                       Container(
//                         width: 272.w,
//                         height: 48.h,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(
//                                 Icons.abc,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () => {},
//                             ),
//                             Padding(padding: EdgeInsets.only(left: 20.0)),
//                             Expanded(
//                               child: TextField(
//                                 textAlign: TextAlign.start,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'[а-яА-Я]'))
//                                 ],
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Откуда - Москва",
//                                     hintStyle: Theme.of(context)
//                                         .textTheme
//                                         .displayLarge!
//                                         .copyWith(
//                                             color: Colors.grey,
//                                             fontSize: 16.sp)),
//                                 onChanged: (text) {},
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.abc,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () => {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),
//                   ),
//                 ],
//               ),
//             ),



//-----
//SearchPage

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tesy_app/bloc/search_bloc.dart';
// import 'package:tesy_app/bloc/search_event.dart';
// import 'package:tesy_app/bloc/search_state.dart';
// import 'package:tesy_app/screens/const.dart';
// import 'package:tesy_app/screens/country_selected_page.dart';

// class SearchPage extends StatefulWidget {
//   SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
//       final bloc = context.read<SearchBloc>();

//       TextEditingController title1Controller =
//           TextEditingController(text: state.text1);
//       title1Controller.value = title1Controller.value.copyWith(
//           text: bloc.state.text1,
//           selection: TextSelection.fromPosition(
//               TextPosition(offset: bloc.state.text1.length)));

//       TextEditingController title2Controller =
//           TextEditingController(text: state.text2);
//       title2Controller.value = title2Controller.value.copyWith(
//           text: bloc.state.text2,
//           selection: TextSelection.fromPosition(
//               TextPosition(offset: bloc.state.text2.length)));
//       return SafeArea(
//           child: Column(
//         children: [
//           SizedBox(
//             height: 16.h,
//           ),
//           Container(
//             height: 5.h,
//             width: 38.w,
//             decoration: BoxDecoration(
//                 color: Color(0xff5E5F61),
//                 borderRadius: BorderRadius.all(Radius.circular(8.r))),
//           ),
//           SizedBox(
//             height: 24.h,
//           ),
//           Center(
//             child: Container(
//               height: 97.h,
//               width: 328.w,
//               decoration: BoxDecoration(
//                   color: Color(0xff2F3035),
//                   borderRadius: BorderRadius.all(Radius.circular(8.r))),
//               child: Column(children: <Widget>[
//                 Container(
//                   width: 298.w,
//                   height: 48.h,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       IconButton(
//                         icon: ConstSvgIcons().changeSizeAndColor(
//                             ConstSvgIcons().samolet, Colors.white, 24.w, 24.h),
//                         onPressed: () => {},
//                       ),
//                       Padding(padding: EdgeInsets.only(left: 20.0)),
//                       Expanded(
//                         child: TextField(
//                           controller: title1Controller,
//                           textAlign: TextAlign.start,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.allow(
//                                 RegExp(r'[а-яА-Я]'))
//                           ],
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Откуда - Москва",
//                               hintStyle: Theme.of(context)
//                                   .textTheme
//                                   .displayLarge!
//                                   .copyWith(
//                                       color: Colors.grey, fontSize: 16.sp)),
//                           onChanged: (text) {
//                             bloc.add(OnChangeFirstSearchEvent(text: text));
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 298.w,
//                   height: 1.h,
//                   color: Colors.green,
//                 ),
//                 Container(
//                   width: 298.w,
//                   height: 48.h,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       IconButton(
//                         icon: ConstSvgIcons().changeSizeAndColor(
//                             ConstSvgIcons().search, Colors.white, 24.w, 24.h),
//                         onPressed: () => {},
//                       ),
//                       Padding(padding: EdgeInsets.only(left: 20.0)),
//                       Expanded(
//                         child: TextField(
//                           controller: title2Controller,
//                           textAlign: TextAlign.start,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.allow(
//                                 RegExp(r'[а-яА-Я]'))
//                           ],
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Куда - Турция",
//                               hintStyle: Theme.of(context)
//                                   .textTheme
//                                   .displayLarge!
//                                   .copyWith(
//                                       color: Colors.grey, fontSize: 16.sp)),
//                           onChanged: (text) {
//                             bloc.add(OnChangeSecondSearchEvent(text: text));
//                           },
//                         ),
//                       ),
//                       IconButton(
//                         icon: ConstSvgIcons().changeSizeAndColor(
//                             ConstSvgIcons().close, Colors.white, 24.w, 24.h),
//                         onPressed: () {
//                           bloc.add(OnSwapSerchEvent());
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//           SizedBox(
//             height: 24.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 17.w, bottom: 30.h),
//             child: Wrap(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(right: 16.w),
//                   child: Container(
//                     width: 70.w,
//                     height: 90.h,
//                     color: Colors.amber,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 48.w,
//                           height: 48.h,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           "Cложный маршрут",
//                           textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(right: 16.w),
//                   child: Container(
//                     width: 79.w,
//                     height: 73.h,
//                     color: Colors.amber,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 48.w,
//                           height: 48.h,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           "Куда угодно",
//                           textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(right: 16.w),
//                   child: Container(
//                     width: 64.w,
//                     height: 73.h,
//                     color: Colors.amber,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 48.w,
//                           height: 48.h,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           "Выходные",
//                           textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(right: 16.w),
//                   child: Container(
//                     width: 65.w,
//                     height: 90.h,
//                     color: Colors.amber,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 48.w,
//                           height: 48.h,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           "Горячие билеты",
//                           textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 328.w,
//             height: 216.h,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(16.r),
//                 ),
//                 color: Color(0xff2F3035)),
//             child: Padding(
//               padding: EdgeInsets.all(16.w),
//               child: Column(
//                 children: [
//                   Container(
//                     // decoration: BoxDecoration(
//                     //   border: Border(
//                     //     bottom: BorderSide(width: 1.5, color: Colors.green),
//                     //   ),
//                     // ),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // Navigator.push()
//                           },
//                           child: Container(
//                             width: 296.w,
//                             height: 56.h,
//                             child: ListTile(
//                               leading: Container(
//                                 width: 40.w,
//                                 height: 40.h,
//                                 color: Colors.amber,
//                               ),
//                               title: Text("Стамбул"),
//                               subtitle: Text("Популярное направление"),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 270.w,
//                     height: 1.h,
//                     color: Colors.green,
//                   ),
//                   Container(
//                     // decoration: BoxDecoration(
//                     //   border: Border(
//                     //     bottom: BorderSide(width: 1.5, color: Colors.green),
//                     //   ),
//                     // ),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => CountrySelectedPage()));
//                           },
//                           child: Container(
//                             width: 296.w,
//                             height: 56.h,
//                             child: ListTile(
//                               leading: Container(
//                                 width: 40.w,
//                                 height: 40.h,
//                                 color: Colors.amber,
//                               ),
//                               title: Text("Стамбул"),
//                               subtitle: Text("Популярное направление"),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 270.w,
//                     height: 1.h,
//                     color: Colors.green,
//                   ),
//                   Container(
//                     // decoration: BoxDecoration(
//                     //   border: Border(
//                     //     bottom: BorderSide(width: 1.5, color: Colors.green),
//                     //   ),
//                     // ),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // Navigator.push()
//                           },
//                           child: Container(
//                             width: 296.w,
//                             height: 56.h,
//                             child: ListTile(
//                               leading: Container(
//                                 width: 40.w,
//                                 height: 40.h,
//                                 color: Colors.amber,
//                               ),
//                               title: Text("Стамбул"),
//                               subtitle: Text("Популярное направление"),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 270.w,
//                     height: 1.h,
//                     color: Colors.green,
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ));
//     }));
//   }
// }

// class AnimatedContainerApp extends StatefulWidget {
//   @override
//   _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
// }

// class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
//   double height = 300;
//   bool gestureUp = false;

//   @override
//   Widget build(BuildContext context) {
//     final maxHeight = 300.0;
//     final minHeight = 100.0;
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('AnimatedContainer Demo'),
//         ),
//         body: Align(
//           alignment: Alignment.bottomCenter,
//           child: AnimatedContainer(
//               color: Colors.red,
//               height: height,
//               duration: Duration(milliseconds: 200),
//               curve: Curves.fastOutSlowIn,
//               child: GestureDetector(
//                 onVerticalDragUpdate: (details) {
//                   setState(() {
//                     if (0 < details.delta.dy)
//                       gestureUp = false;
//                     else
//                       gestureUp = true;
//                     height -= details.delta.dy;
//                     if (height > maxHeight)
//                       height = maxHeight;
//                     else if (height < minHeight) height = minHeight;
//                   });
//                 },
//                 onVerticalDragEnd: (details) {
//                   setState(() {
//                     if (gestureUp) {
//                       height = maxHeight;
//                     } else {
//                       height = minHeight;
//                     }
//                   });
//                 },
//               )),
//         ),
//       ),
//     );
//   }
// }
