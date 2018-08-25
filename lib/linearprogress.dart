import 'package:flutter/material.dart';
import 'package:circular_progress/linearbars/linearbar_border_fill.dart';
import 'package:circular_progress/linearbars/linearbar_fill.dart';
import 'package:circular_progress/linearbars/linearbar_label_fill.dart';

class LinearProgress extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(colors: [
//          const Color(0xFFE8405A),
//          const Color(0xFFF7D55F),
//          const Color(0xFFABE1BF),
//          const Color(0xFF66B2FC),
//          const Color(0xFF00c6fb),
//          const Color(0xFF005bea),
          const Color(0xFFffffff),
          const Color(0xFFdfe9f3),
        ],
        begin: Alignment.topRight, end: Alignment.bottomLeft)
      ),
      child: new Stack(children: <Widget>[
        new Scaffold(
          appBar: new AppBar(
            title: new Text('Linear Progress'),
            elevation: 0.0,
//            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: new Container(
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                new LinearbarFillBorder(size: new Size(width*0.95, height/30),
                    backgroundColor: const Color(0xFF2A2A2A)),
                new SizedBox(height: height/20,),
                new LinearbarFill(size: new Size(width*0.95, height/30),
                    backgroundColor: const Color(0xFF2A2A2A)),
                new SizedBox(height: height/20,),
//                new LinearbarFillLabel(size: new Size(width*0.95, height/20),
//                    backgroundColor: const Color(0xFF2A2A2A)),
              ],),
            ),
          ),
        )
      ],),
    );
  }

}