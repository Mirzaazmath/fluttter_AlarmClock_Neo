import 'package:flutter/material.dart';
import 'package:timer_app/cubits/navigation_cubit/navigationcubit.dart';
import 'package:timer_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/counter_cubit/counter_cubit.dart';
import 'cubits/stopwatchcubit/stopwatchcubit.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme:const  AppBarTheme(
          elevation: 0,
          backgroundColor:  Color(0xff232429),
        ),
        scaffoldBackgroundColor:const Color(0xff232429),
        primaryColor:const  Color(0xff161719),
        primaryColorLight: Colors.white,
        primaryColorDark:const  Color(0xff56575c)
      ),
      home:  MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>(
              create: (BuildContext context) => NavigationCubit(),
            ),
            BlocProvider<StopWatchCubit>(
              create: (BuildContext context) => StopWatchCubit(),
            ),
            BlocProvider<CounterCubit>(
              create: (BuildContext context) => CounterCubit(),
            ),
          ],


          child: HomeScreen()),

    );
  }
}
