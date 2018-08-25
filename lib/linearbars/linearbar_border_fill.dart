import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:core';

class LinearbarFillBorder extends StatefulWidget{
  final Size size;
  final Color backgroundColor;
  final Color color;
  LinearbarFillBorder({@required this.size, this.backgroundColor = Colors.grey, this.color = Colors.blue});

  @override
  _LinearbarFill createState() => new _LinearbarFill();

}

class _LinearbarFill extends State<LinearbarFillBorder> with SingleTickerProviderStateMixin{

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
      child: new Row(children: <Widget>[
        new Expanded(child: new Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
          new Container(
            height: widget.size.height,
            decoration: new BoxDecoration(color: Colors.black,
                borderRadius: new BorderRadius.all(new Radius.circular(widget.size.height/2)),
                border: new Border.all(color: widget.backgroundColor, style: BorderStyle.solid, width: widget.size.height/3)
            ),
            alignment: Alignment.centerLeft,
          ),
          new Padding(padding: new EdgeInsets.only(left: widget.size.height/3, right: widget.size.height/3),
          child: new Container(

            height: widget.size.height/3,
            width: animation.value,

            decoration: new BoxDecoration(
                color: Colors.yellow,
                borderRadius: new BorderRadius.all(new Radius.circular(widget.size.height/6)),
              gradient: new LinearGradient(colors: [Colors.yellow[700], Colors.redAccent],)
            ),
          ),),
        ],)),
        new SizedBox(width: widget.size.width/8,
          child: new Text('${(animation.value/(7*widget.size.width/8 - 2*widget.size.height/3)*100).round()}%',
          textAlign: TextAlign.center, style: new TextStyle(fontSize: widget.size.width/25, fontWeight: FontWeight.bold),),
        ),
      ],),
    );
  }
}