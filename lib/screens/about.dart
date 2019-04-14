import 'package:flutter/material.dart';
import 'package:kideoos/utils/background_kideoos.dart';

class About extends StatelessWidget {

  final backgroundKideoos  =  BackgroundKideoos();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.indigo,
        elevation: 1.0,
        centerTitle: true,
        title:  Image.asset("images/kideoos.png", height: 200,),

      ),

      body: Stack(
        children: <Widget>[
          backgroundKideoos.setBackKideoos(),


          Card(
            margin: const EdgeInsets.only(top: 25.0, left: 5.0, right: 5.0, bottom: 5.0),


           child: Padding(
              padding: EdgeInsets.all(50),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[



                  Row(


                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        "Versão:", style: TextStyle(fontWeight: FontWeight.bold),

                      ),

                      Text(
                        "1.0.0",

                      ),



                    ],






                  )





                ],
              ),

            ),




          ),
          Positioned(
            top: 2.0,
            left: .0,
            right: .0,
            child: Center(
              child: CircleAvatar(

                backgroundColor: Colors.blue,
                radius: 30.0,
                child: Icon(Icons.info_outline),
              ),
            ),
          )
        ],
      ),
    );
  }
}
