import 'package:flutter/material.dart'hide BoxDecoration, BoxShadow;
import 'package:timer_app/cubits/navigation_cubit/navigationcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:timer_app/screens/stopwatch_screen.dart';
import '../utils/text_util.dart';
import 'alarm_screen.dart';
import 'clock_screen.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List<String>navigationlist=["Clock","Stopwatch","Alarm","Timer"];
  List<Widget>screens=[ClockSreen(),StopWatchScreen(),AlarmScreen(),Container()];

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NavigationCubit,int>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            actions: const[
               Padding(
                padding:  EdgeInsets.only(right: 20),
                child: Icon(Icons.sort),
              )
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(58.0),
              child:SizedBox(
        height: 70,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for(int i=0;i<navigationlist.length;i++)...[
                            GestureDetector(
                              onTap: (){
                                context.read<NavigationCubit>().updatenavigation(i);
                              },
                              child: Container(
                                margin:const EdgeInsets.only(right: 20,left: 10),
                                width: 110,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color:state==i ? Theme.of(context).scaffoldBackgroundColor:Colors.transparent,
                                  boxShadow:state==i ? [
                                    BoxShadow(
                                        color:Colors.black.withOpacity(0.9),
                                        offset:const  Offset(2.0,2.0),
                                        blurRadius: 10,
                                        spreadRadius: 0,
                                        inset: true
                                    ),
                                    BoxShadow(
                                        color:Colors.grey.shade800.withOpacity(0.7),
                                        offset:const  Offset(-2.0,-2.0),
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                        inset: true
                                    ),
                                  ]:[]


                                ),
                                child: CText(text: navigationlist[i],color: state==i?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark),


                              ),
                            )
                          ]
                        ],
                      ),
                    ),


              ),


            ),
          ),
          body: screens[state],

        );
      }
    );
  }
}
