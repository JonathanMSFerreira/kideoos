import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:kideoos/animation/sprite_painter.dart';
import 'package:kideoos/screens/parents.dart';
import 'package:kideoos/utils/background_kideoos.dart';



class SpriteButton extends StatefulWidget {
  @override
  SpriteButtonState createState() => new SpriteButtonState();
}

class SpriteButtonState extends State<SpriteButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final backgroundKideoos  =  BackgroundKideoos();

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Stack(

         children: <Widget>[

          backgroundKideoos.setBackKideoos(),



          Center(


            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

             //   Text("Kideoos", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue[700]),),
                Image.asset(
                  "images/kideoos.png",
                  height: 80.0,

                ),


                  Text("Video player para crianças",style: TextStyle(fontSize: 20, color: Colors.indigo, fontWeight: FontWeight.bold),),


                SizedBox(

                  height: 100,


                ),

                CustomPaint(
                  painter: new SpritePainter(_controller),
                  child: new SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child:

                    GestureDetector(
                      child: Image.asset(
                        "images/oo.png",
                        height: 20.0,

                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => Parents()));
                      },
                    ),
                  ),
                ),







              ],



            )




          ) ,
        ],
      )
    );
  }
}