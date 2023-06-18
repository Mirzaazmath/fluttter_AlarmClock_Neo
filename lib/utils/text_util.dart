import 'package:flutter/material.dart';
class CText extends StatelessWidget {
  String text;
  double? size;
  Color? color;
   CText({Key? key,required this.text,this.size,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(color: color??Theme.of(context).primaryColorLight,fontSize: size??15,fontWeight: FontWeight.bold),);
  }
}
