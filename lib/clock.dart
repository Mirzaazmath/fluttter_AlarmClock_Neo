import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timer_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClockView extends StatefulWidget {
  final double? size;
  final String  mode;

  const ClockView({Key? key, this.size,required this.mode}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  late Timer timer;


  @override
  void initState() {
    this.timer =

        Timer.periodic(Duration(seconds: 1), (_) {
      if(widget.mode=="start"){
        context.read<CounterCubit>().increment();
      }else if (widget.mode=="hold"){
        print("s1");
        context.read<CounterCubit>().reset();
      }else{

      }



    });
    super.initState();
  }

  @override
  void dispose() {
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   if(widget.mode=="hold"){
     context.read<CounterCubit>().reset();
   }
    return BlocBuilder<CounterCubit,int>(
      builder: (context,state) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: widget.size,
            height: widget.size,
            child: Transform.rotate(
              angle: -pi / 2,
              child: CustomPaint(
                painter: ClockPainter(state),
              ),
            ),
          ),
        );
      }
    );
  }
}

class ClockPainter extends CustomPainter {
  int value;
  ClockPainter(this.value);

  var dateTime = DateTime.now();
  static Color clockOutline = Color(0xFFEAECFF);
  static Color? secHandColor = Color(0xffec93a9);

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    var radius = min(centerX, centerY);



    var secHandBrush = Paint()
      ..color = secHandColor!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 25;


    var dashBrush = Paint()
      ..color = clockOutline
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;



    var secHandX = centerX + radius * 0.8 * cos(value * 6 * pi / 180);
    var secHandY = centerY + radius * 0.8 * sin(value * 6 * pi / 180);

     canvas.drawCircle( Offset(secHandX, secHandY),radius*0.01, secHandBrush);


    var outerRadius = radius;
    var innerRadius = radius * 0.9;
    for (var i = 0; i < 360; i += 4) {
      var x1 = centerX + outerRadius * cos(i * pi / 180);
      var y1 = centerY + outerRadius * sin(i * pi / 180);

      var x2 = centerX + innerRadius * cos(i * pi / 180);
      var y2 = centerY + innerRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
