import 'package:flutter/material.dart';
import 'package:kideoos/utils/background_kideoos.dart';

class Help extends StatelessWidget {

  final backgroundKideoos  =  BackgroundKideoos();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueAccent,
        elevation: 1.0,
        centerTitle: true,
        title:  Image.asset("images/kideoos.png", height: 200,),

      ),

      body: Stack(
        children: <Widget>[
          backgroundKideoos.setBackKideoos(255,190,255,1,155,255,255,1),


          Card(
            margin: const EdgeInsets.only(top: 25.0, left: 5.0, right: 5.0),
            child: SizedBox(
                height: 100.0,
            //    width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 45.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Como adicionar vídeos?",
                        style: Theme.of(context).textTheme.subhead,
                      ),

                      Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[



                                Icon(Icons.video_library),

                                Text("->")


                              ],


                            )

                    ],
                  ),
                )),
          ),
          Positioned(
            top: 2.0,
            left: .0,
            right: .0,
            child: Center(
              child: CircleAvatar(

                backgroundColor: Colors.blue,
                radius: 30.0,
                child: Icon(Icons.video_library),
              ),
            ),
          )
        ],
      ),
    );
  }
}
