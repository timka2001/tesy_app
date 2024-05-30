import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesy_app/bloc/search_bloc.dart';
import 'package:tesy_app/bloc/search_event.dart';
import 'package:tesy_app/screens/country_selected/country_selected_page.dart';
import 'package:tesy_app/screens/home/home_page.dart';
import 'package:tesy_app/screens/tickets_page.dart';
import 'package:tesy_app/server/server.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SearchBloc(InitialSearchEvent()),
        child: ScreenUtilInit(
            designSize: const Size(360, 722),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [const Locale('en'), const Locale('ru')],
                theme: ThemeData(
                    fontFamily: 'SF Pro Display',
                    scaffoldBackgroundColor: Colors.black,
                    textTheme: const TextTheme(
                      displayLarge: TextStyle(fontWeight: FontWeight.w300),
                      displayMedium: TextStyle(fontWeight: FontWeight.w400),
                      displaySmall: TextStyle(fontWeight: FontWeight.w500),
                      headlineLarge: TextStyle(fontWeight: FontWeight.w600),
                    )),
                home: MyHomePage(),
              );
            }));
  }
}
