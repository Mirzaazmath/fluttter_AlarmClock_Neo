import 'package:flutter/material.dart'hide BoxDecoration, BoxShadow;
import 'package:timer_app/clock.dart';
import 'package:timer_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:timer_app/cubits/stopwatchcubit/stopwatchcubit.dart';
import 'package:timer_app/utils/text_util.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class StopWatchScreen extends StatelessWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<StopWatchCubit,String>(
      builder: (context,state) {
        print(stoplist);
        return Scaffold(
          bottomNavigationBar: Container(
            height: 80,
            width: double.infinity,

            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color:Colors.black.withOpacity(0.5),
                    offset:const  Offset(5.0,5.0),
                    blurRadius: 10.0,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color:Colors.black.withOpacity(0.03),
                    offset:const  Offset(-18.0,-15.0),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),



                ]

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    context.read<StopWatchCubit>().start();
                  },
                  child: Container(

                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: state=="start"? [
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
                        ]:
                        [
                          BoxShadow(
                            color:Colors.black.withOpacity(0.7),
                            offset:const  Offset(5.0,5.0),
                            blurRadius: 10.0,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color:Colors.grey.shade800.withOpacity(0.5),
                            offset:const  Offset(-3.0,-3.0),
                            blurRadius: 5,
                            spreadRadius: 0,
                          ),
                        ]


                    ),
                    alignment: Alignment.center,
                    child: CText(text: "START",color:const  Color(0xff746da3),),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    context.read<StopWatchCubit>().reset();
                  },
                  child: Container(

                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: state=="hold"? [
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
                        ]:
                        [
                          BoxShadow(
                            color:Colors.black.withOpacity(0.7),
                            offset:const  Offset(5.0,5.0),
                            blurRadius: 10.0,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color:Colors.grey.shade800.withOpacity(0.5),
                            offset:const  Offset(-3.0,-3.0),
                            blurRadius: 5,
                            spreadRadius: 0,
                          ),
                        ]
                    ),
                    alignment: Alignment.center,
                    child: CText(text: "RESET",color:const  Color(0xffec354d),),

                  ),
                ),
              ],
            )
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const  SizedBox(height: 10,),
                  Center(
                    child: Container(
                      padding:const  EdgeInsets.all(5),
                      height: 270,
                      width: 270,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:Theme.of(context).scaffoldBackgroundColor,

                          boxShadow: [
                            BoxShadow(
                              color:Colors.black.withOpacity(0.7),
                              offset:const  Offset(5.0,5.0),
                              blurRadius: 10.0,
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color:Colors.grey.shade800.withOpacity(0.5),
                              offset:const  Offset(-3.0,-3.0),
                              blurRadius: 5,
                              spreadRadius: 0,
                            ),



                          ]

                      ),
                      child:  Stack(
                        children: [
                          ClockView(mode: state,size: 270,),
                          Center(
                            child: Container(
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color:Colors.black.withOpacity(0.7),

                                      spreadRadius: 5,
                                      blurRadius: 20,
                                      offset: const Offset(-5, -5),
                                      inset: true// changes position of shadow
                                  ),
                                  BoxShadow(
                                      color:Colors.black.withOpacity(0.7),
                                      spreadRadius: 5,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                      inset: true// changes position of shadow
                                  ),
                                ]
                              ),
                              alignment: Alignment.center,
                              child: BlocBuilder<CounterCubit,int>(
                                builder: (context,state) {
                                  return CText(text: state.toString(),size: 30,);
                                }
                              ),

                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                 stoplist.isEmpty?Container(): GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                    children: <Widget>[
                    for(int i=0;i<stoplist.length;i++)...[
                      Container(
                        padding:const  EdgeInsets.all(16),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color:Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(30),

                            boxShadow: [
                              BoxShadow(
                                color:Colors.black.withOpacity(0.7),
                                offset:const  Offset(5.0,5.0),
                                blurRadius: 10.0,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color:Colors.grey.shade800.withOpacity(0.5),
                                offset:const  Offset(-3.0,-3.0),
                                blurRadius: 5,
                                spreadRadius: 0,
                              ),
                            ]

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [GestureDetector(
                                onTap: (){
                                //  context.read<StopWatchCubit>().delete(stoplist[i]);
                                },
                                  child: Icon(Icons.delete,color: Theme.of(context).primaryColorDark,))],
                            ),
                            CText(text: "LAP ${i+1}",size: 10,color: Theme.of(context).primaryColorDark,),
                            CText(text: stoplist[i].toString(),size: 40,),
                            CText(text: "Seconds",size: 10,color: Theme.of(context).primaryColorDark,),
                          ],
                        ),
                      )
                    ]
                    ],
                  )

                ],
              ),
            ),
          ),

        );
      }
    );
  }
}
