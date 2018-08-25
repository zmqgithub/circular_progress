import 'package:flutter/material.dart';
import 'package:circular_progress/circularbar/circular_bar.dart';
import 'package:circular_progress/circularbar/circular_bar_typeb.dart';
import 'package:circular_progress/circularbar/circular_bar_typec.dart';
import 'package:circular_progress/circularbar/circular_bar_typed.dart';
import 'package:circular_progress/circularbar/circular_bar_typee.dart';
import 'package:circular_progress/circularbar/circular_bar_typef.dart';
import 'package:circular_progress/circularbar/circular_bar_fill.dart';
import 'package:circular_progress/circularbar/hexagonal_bar.dart';
import 'package:circular_progress/triangularbar/triangular_bar.dart';
import 'package:circular_progress/triangularbar/triangular_bar_fill.dart';
import 'package:circular_progress/triangularbar/triangular_bar_line.dart';
import 'linearprogress.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: 'Circular Progrssbars'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return new Container(
      child: new Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [const Color(0xFF000046), const Color(0xFF1CB5E0)]
            ,begin: Alignment.topRight, end: Alignment.bottomLeft)
          ),
        ),
        new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.crop_5_4), onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LinearProgress()),
                );
              })
            ],
          ),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                  new CircularProgress(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),),
                  new CircularProgressb(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),),
                  new CircularProgressc(size: width/4, color: const Color(0xFFFD9830), backgroundColor: const Color(0xFFFD9830),)
                ],),
                new SizedBox(height: width/20,),
                new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                  new CircularProgressd(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),),
                  new CircularProgresse(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),),
                  new CircularProgressf(size: width/4, color: const Color(0xFF35FFFD), backgroundColor: const Color(0xFF051262),)
                ],),
                new SizedBox(height: width/20,),
                new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                  new CircularProgressFill(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),),
                  new HexagonalProgress(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),),
                  new CircularProgress(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),)
                ],),
                new SizedBox(height: width/20,),
                new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                  new TriangularProgressLine(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),),
                  new TriangularProgress(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),),
                  new TriangularProgressFill(size: width/4, color: const Color(0xFF1CB5E0), backgroundColor: const Color(0xFF000046),)
                ],)
                ],
            ),
          ),

        )
      ],),
    );
  }
}
