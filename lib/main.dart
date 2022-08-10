// ignore_for_file: prefer_const_constructors, deprecated_member_use, non_constant_identifier_names, avoid_types_as_parameter_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Cubit/cubit.dart';
import 'Cubit/observer.dart';
import 'layout/news_app.dart';
import 'network/Local/cache_helper.dart';
import 'network/Remote/dio_helper.dart';
import 'newcubit/ncubit.dart';
import 'newcubit/nstates.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CasheHelper.init();
  bool? isDark = CasheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark, {Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSport()
            ..getscience()
            ..getentertainment()
            ..gettechnology(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              Nappcubit()..changethememode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<Nappcubit, Nappstatus>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NewsApp',
            themeMode: Nappcubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.dark,
                    )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  elevation: 20.0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                )),
            darkTheme: ThemeData(
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white60),
                ),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('15202b'),
                appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    iconTheme: IconThemeData(
                      color: Colors.white60,
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    backgroundColor: HexColor('15202b'),
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('15202b'),
                      statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.light,
                    )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.white60,
                  backgroundColor: HexColor('15202b'),
                  elevation: 20.0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                )),
            home: Newshome(),
          );
        },
      ),
    );
  }
}
