import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_app/utils/text_util.dart';
class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  
  List<int>active=[];
  void addalarm(int value){
    if(active.contains(value)){
      active.remove(value);
    }else{
      active.add(value);
    }
    setState(() {
      
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,

        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
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
        child: Container(

          height: 50,
          width: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(25),
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
          alignment: Alignment.center,
          child: CText(text: "ADD",color:const  Color(0xff746da3),),

        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              for(int i=1;i<=5;i++)...[Container(
                margin:const  EdgeInsets.only(bottom: 30),
                padding:const  EdgeInsets.all(15),
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
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

                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CText(text: "ALARM 1" ,color: Theme.of(context).primaryColorDark,size: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CText(text: "20:${50+i} AM" ,size: 30,),
                        Transform.scale(
                          scale: 0.8,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(25),
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
                            child: CupertinoSwitch(

                                value: active.contains(i), onChanged: (value){
                                  addalarm(i);

                            }),
                          ),
                        )
                      ],
                    ),
                    CText(text: "Every day" ,color: Theme.of(context).primaryColorDark,size: 15,),
                  ],
                ),

              ),]
            ],
          ),
        ),
      ),

    );
  }
}
