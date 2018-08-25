import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:core';

class LinearbarFillLabel extends StatefulWidget{
  final Size size;
  final Color backgroundColor;
  final Color color;
  LinearbarFillLabel({@required this.size, this.backgroundColor = Colors.grey, this.color = Colors.blue});

  @override
  _LinearbarFill createState() => new _LinearbarFill();

}

class _LinearbarFill extends State<LinearbarFillLabel> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 20000))..repeat();
    animation = Tween(begin: 0.0, end: 7*widget.size.width/8 - 2*widget.size.height/3).animate(controller);
    controller.addListener((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Container(
      width: widget.size.width,
      height: widget.size.height,
      color: Colors.yellow[800],
      child: new Stack(children: <Widget>[
        new Padding(padding: new EdgeInsets.only(top: widget.size.height/2),
        child: new Container(
          color: Colors.yellow[700],
        ),)
      ],),
    );
  }
}