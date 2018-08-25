import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:core';

class CircularProgressb extends StatefulWidget{
  final double size;
  final Color backgroundColor;
  final Color color;
  CircularProgressb({@required this.size, this.backgroundColor = Colors.grey, this.color = Colors.blue});

  @override
  _CircularProgressb createState() => new _CircularProgressb();

}

class _CircularProgressb extends State<CircularProgressb> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 10000))..repeat();
    animation = Tween(begin: 0.0, end: 360.0).animate(controller);
    controller.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {



    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
      
      new CustomPaint(
        painter: new CircularCanvas(progress: animation.value, backgroundColor: widget.backgroundColor, color: widget.color),
        size: new Size(widget.size, widget.size),
      ),
      new Text('${(animation.value/360*100).round()}%',
      style: new TextStyle(color: widget.color, fontSize: widget.size/5, fontWeight: FontWeight.bold),)
    ],);
  }
}

class CircularCanvas extends CustomPainter{
  final double progress;
  final Color backgroundColor;
  final Color color;

  CircularCanvas({this.progress, this.backgroundColor = Colors.grey, this.color = Colors.blue});
  @override
  void paint(Canvas canvas, Size size) {


    var paint = new Paint();
    paint..color = backgroundColor
    ..strokeWidth = size.width/25
//      ..strokeCap = StrokeCap.round
//      ..strokeJoin = StrokeJoin.miter

    ..style = PaintingStyle.stroke;

//    canvas.drawCircle(new Offset(size.width/2, size.height/2), size.width/2, paint);
    
    Rect rect = new Offset(0.0, 0.0)&size;
//    paint..shader = new LinearGradient(colors: [Colors.white, color]
//    ,begin: Alignment.topRight, end: Alignment.bottomLeft).createShader(rect);

//    canvas.drawArc(new Offset(0.0, 0.0)
//    &new Size(size.width, size.width), -90.0*0.0174533, progress*0.0174533,
//        false, paint..color = color);
//
//    paint..isAntiAlias = true;
//
//    var path = new Path();
//    path.moveTo(0.0, 0.0);
//    path.lineTo(size.width, size.height);
//    path.fillType = PathFillType.evenOdd;
//    canvas.drawPath(path, paint);

    for(int i=0; i<36; i++){
      canvas.drawArc(new Offset(0.0, 0.0)
      &new Size(size.width, size.width), (-90.0 + i*10)*0.0174533, 8*0.0174533,
          false, paint..color = backgroundColor);

      if(i < progress/10){
        canvas.drawArc(new Offset(0.0, 0.0)
        &new Size(size.width, size.width), (-90.0 + i*10)*0.0174533, 8*0.0174533,
            false, paint..color = color);
      }
    }


//
//    canvas.drawArc(new Offset(0.0, 0.0)
//    &new Size(size.width, size.width), -90.0*0.0174533, progress*0.0174533,
//        false, paint..color = color);
//
//    for(int i=0; i<36; i++){
//      canvas.drawArc(new Offset(0.0, 0.0)
//      &new Size(size.width, size.width), (-90.0 + i*10-2)*0.0174533, 2*0.0174533,
//          false, paint..color = Colors.white);
//    }


  }

  @override
  bool shouldRepaint(CircularCanvas oldDelegate) {
    return oldDelegate.progress !=progress;
  }

}