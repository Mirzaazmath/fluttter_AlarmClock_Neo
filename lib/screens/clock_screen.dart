import 'package:flutter/material.dart'hide BoxDecoration, BoxShadow;
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
class ClockSreen extends StatelessWidget {
  const ClockSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           const  SizedBox(height: 10,),
            Center(
              child:   Container(
                width: 270,
                height: 270,
                child: AnalogClock(
                  decoration: BoxDecoration(

                      color: Colors.transparent,
                      shape: BoxShape.circle),

                  isLive: true,
                  hourHandColor: Colors.red,
                  minuteHandColor:Colors.white ,
                  showSecondHand: true,
                  secondHandColor:Colors.blue,
                  numberColor:Colors.white ,
                  showNumbers: true,
                  textScaleFactor: 1.4,
                  showTicks: true,
                  showDigitalClock: true,
                  digitalClockColor:Colors.white ,


                ),
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
              ),

            ),
           const  SizedBox(height: 100,),
            DigitalClockWidget()
            

          ],
        ),
      ),


    );
  }
}
class DigitalClockWidget extends StatelessWidget {
  const DigitalClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Theme.of(context).scaffoldBackgroundColor,shadows:[
          BoxShadow(
          color:Colors.grey.shade800,

          offset: Offset(2.0,2.0),
          blurRadius: 4.0,
          spreadRadius: 1.0,
        ),
          BoxShadow(
            color:Colors.black.withOpacity(0.7),
            offset:const  Offset(-2.0,-2.0),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        //   BoxShadow(
        //       color:Colors.black.withOpacity(0.9),
        //       offset:const  Offset(2.0,2.0),
        //       blurRadius: 10,
        //       spreadRadius: 0,
        //       inset: true
        //   ),
        //   BoxShadow(
        //       color:Colors.grey.shade800.withOpacity(0.7),
        //       offset:const  Offset(-2.0,-2.0),
        //       blurRadius: 2,
        //       spreadRadius: 0,
        //       inset: true
        //   ),

        ] ),
        );
      },
    );
  }
}

