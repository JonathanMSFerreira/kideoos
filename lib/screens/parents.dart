import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kideoos/blocs/favorite_bloc.dart';
import 'package:kideoos/blocs/videos_bloc.dart';
import 'package:kideoos/models/video.dart';
import 'package:kideoos/screens/about.dart';
import 'package:kideoos/screens/help.dart';
import 'package:kideoos/screens/kideoos.dart';
import 'package:kideoos/screens/result_search.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:kideoos/utils/background_kideoos.dart';

class Parents extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  //  final bloc = BlocProvider.of<VideosBloc>(context);

    final backgroundKideoos  =  BackgroundKideoos();

    return Scaffold(

        appBar: AppBar(

          backgroundColor: Colors.blueAccent
          ,
          elevation: 1.0,
          centerTitle: true,
          title:  Image.asset("images/kideoos.png", height: 200,),

        ),


        body: SafeArea(

          bottom: false,

            child: Stack(children: <Widget>[

              backgroundKideoos.setBackKideoos(255,230,255,1,155,255,255,1),

//              ClipPath(
//                clipper: WaveClipperOne(),
//                clipper: WaveClipperTwo(),
//                child: Container(
//                  height: 110,
//                  color: Colors.indigo,
//                  child: Align(
//                      alignment: Alignment.topLeft,
//                       child: Image.asset("images/kideoos.png", height: 70,),
//                      ),
//                ),
//              ),

            Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: new StaggeredGridView.count(
                  crossAxisCount: 5,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  padding: const EdgeInsets.all(1.0),
                  staggeredTiles: _staggeredTilesVideos(),
                  children: _tilesVideos(context),

                ))

          ],)));
  }


  List<StaggeredTile> _staggeredTilesVideos(){


   return <StaggeredTile>[


      const StaggeredTile.count(5, 3),
      const StaggeredTile.count(2, 2),
   // const StaggeredTile.count(2, 1),
      const StaggeredTile.count(2, 2),
      const StaggeredTile.count(2, 1),


   ];

  }


 List<Widget> _tilesVideos(context){

  return  <Widget>[

      _cardMyVideos(context),

       _cardHome(context),
    //   _cardHelp(context),

       _cardAbout(context),
       _cardClose(context)

   ];}

  _cardMyVideos(context){

    return

      GestureDetector(

        child: Card(
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            elevation: 3.0,
            color: Colors.blue,
            child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.video_library, color: Colors.white, size: 30,
                      ),

                    ),
                    Text("Meus Vídeos", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),


                     Stack(

                       children: <Widget>[

                         Center(
                           child:Icon(Icons.star, size: 70, color: Colors.yellow,) ,


                         )
                          ,


                         Container(

                           alignment: Alignment.center,
                           height: 70,
                           child:
                           StreamBuilder<Map<String, Video>>(
                               stream: BlocProvider.of<
                                   FavoriteBloc>(context)
                                   .outFav,
                               builder: (context, snapshot) {
                                 if (snapshot.hasData)

                                   return
                                     Text(snapshot.data.length < 100 ? "${snapshot.data.length}" : "99+", style: TextStyle(color: Colors.black),);
                                 else
                                   return Container();
                               }),
                         ),],),



                  ],
                ))),
        onTap: (){

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ResultSearch()));

        },

      );

  }

  _cardClose(context){


   return
     GestureDetector(
       child:

       Card(
           shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
           elevation: 3.0,
           color: Colors.redAccent,
           child: Container(
               padding: EdgeInsets.all(10.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Icon(
                       Icons.close, color: Colors.white, size: 18,


                   ),
                   Text("Fechar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0),)
                 ],
               ))),
       onTap: (){

         SystemNavigator.pop();

       },);
  }

  _cardHelp(context){


    return
      GestureDetector(
        child:

        Card(
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            elevation: 3.0,
            color: Colors.deepPurple,
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.help, color: Colors.white,


                    ),
                    Text("Ajuda", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)
                  ],
                ))),
        onTap: (){

          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => Help()));

        },);
  }


  _cardHome(context){

    return

      GestureDetector(

        child:    Card(
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            elevation: 3.0,
            color: Colors.green,
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Icon(Icons.face, color: Colors.white,
                    ),
                    Text("Kids", style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),)
                  ],
                ))),
             onTap: (){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => Kideoos()));


            },


      )

   ;
  }


  _cardAbout(context){


    return
      GestureDetector(
        child: Card(
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            elevation: 3.0,
            color: Colors.deepPurple,
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline, color: Colors.white,


                    ),
                    Text("Sobre", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)
                  ],
                ))),
        onTap: (){

          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => About()));

        },);
  }





}
