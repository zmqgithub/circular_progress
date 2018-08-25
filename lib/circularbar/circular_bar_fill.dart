import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:core';

class CircularProgressFill extends StatefulWidget{
  final double size;
  final Color backgroundColor;
  final Color color;
  CircularProgressFill({@required this.size, this.backgroundColor = Colors.grey, this.color = Colors.blue});

  @override
  _CircularProgress createState() => new _CircularProgress();

}

class _CircularProgress extends State<CircularProgressFill> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 20000))..repeat();
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
      style: new TextStyle(color: Colors.white, fontSize: widget.size/5, fontWeight: FontWeight.bold),)
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
    ..strokeWidth = size.width/20
    ..style = PaintingStyle.fill;

    canvas.drawCircle(new Offset(size.width/2, size.height/2), size.width/2, paint);
    var path = new Path();
    path.moveTo(0.0, size.height/2);
    path.lineTo(size.width/2, size.height/2);

    Rect rect = new Offset(0.0, 0.0)&size;
    path.addArc(rect, (90.0 - progress/2 + (progress%3)*2)*0.0174533 , progress*0.0174533);

    paint..shader = new LinearGradient(colors: [Colors.yellow[500], Colors.red]
        ,begin: Alignment.topRight, end: Alignment.bottomLeft).createShader(rect);
    canvas.drawPath(path, paint..color = Colors.red ..style = PaintingStyle.fill);


  }

  @override
  bool shouldRepaint(CircularCanvas oldDelegate) {
    return oldDelegate.progress !=progress;
  }

}