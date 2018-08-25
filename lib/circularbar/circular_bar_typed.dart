import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:core';

class CircularProgressd extends StatefulWidget{
  final double size;
  final Color backgroundColor;
  final Color color;
  CircularProgressd({@required this.size, this.backgroundColor = Colors.grey, this.color = Colors.blue});

  @override
  _CircularProgress createState() => new _CircularProgress();

}

class _CircularProgress extends State<CircularProgressd> with SingleTickerProviderStateMixin{

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

    var strokeWidth = size.width/18;
    var paint = new Paint();
    paint..color = backgroundColor
      ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill;

    canvas.drawCircle(new Offset(size.width/2, size.height/2), size.width/1.9, paint);

    paint..strokeWidth = strokeWidth
    ..style = PaintingStyle.stroke;

    canvas.drawArc(new Offset(strokeWidth/2, strokeWidth/2)
    &new Size(size.width - strokeWidth, size.width - strokeWidth), -90.0*0.0174533, progress*0.0174533,
        false, paint..color = color);

  }

  @override
  bool shouldRepaint(CircularCanvas oldDelegate) {
    return oldDelegate.progress !=progress;
  }

}