import 'package:flutter/material.dart';
import 'package:kideoos/utils/background_kideoos.dart';

class About extends StatelessWidget {

  final backgroundKideoos  =  BackgroundKideoos();

  @override
  Widget build(BuildContext context) {


    String _info = "    Kideoos é um player de vídeos voltado para crianças, simples e fácil de usar. Com ele, você pode selecionar os vídeos que seu filho"
        " irá visualizar, evitando que ele assista a vídeos com conteúdos impróprios para sua idade.";




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
            margin: const EdgeInsets.only(top: 25.0, left: 5.0, right: 5.0, bottom: 100.0),

           child: Padding(
              padding: EdgeInsets.all(45),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                  Text(_info, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16.0), maxLines: 8,),


                  SizedBox(height: 30,),


                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[



                      Text("Versão: ",
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      Text("1.0.0",
                        style: TextStyle(fontSize: 14.0),
                      )



                    ],


                  ),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[



                      Text("Última atualização: ",
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text("14/04/2019",
                        style: TextStyle(fontSize: 14.0),
                      )



                    ],


                  )







                ],
              ),),),
          Positioned(
            top: 2.0,
            left: .0,
            right: .0,
            child: Center(
              child: CircleAvatar(

                backgroundColor: Colors.indigo,
                radius: 30.0,
                child: Icon(Icons.attach_file, color: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
