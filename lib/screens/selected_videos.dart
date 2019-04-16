import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:kideoos/blocs/favorite_bloc.dart';
import 'package:kideoos/models/video.dart';
import 'package:kideoos/api.dart';
import 'package:kideoos/utils/background_kideoos.dart';


class SelectedVideos extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<FavoriteBloc>(context);
    final backgroundKideoos  =  BackgroundKideoos();


      return StreamBuilder<Map<String, Video>>(
            stream: bloc.outFav,
            initialData: {},
            builder: (context, snapshot) {

              if(bloc.isEmpty()){


               return


                 Stack(

                     children: <Widget>[

                     backgroundKideoos.setBackKideoos(255,190,255,1,155,255,255,1),


                 Center(
                 
                 
                 child: Column(

                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[

                     Icon(Icons.sentiment_dissatisfied, color: Colors.blueAccent, size: 100,),

                     Text("Nenhum vídeo adicionado!", style: TextStyle(color: Colors.blueAccent,fontSize: 20.0, fontWeight: FontWeight.bold),)



                   ],)
                 
                 )]) ;


              }else {
                return CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        snapshot.data.values.map((v) {
                          return InkWell(
                              onTap: () {
                                FlutterYoutube.playYoutubeVideoById(
                                    apiKey: API_KEY, videoId: v.id);
                              },

                              child: _itemVideo(bloc, v));
                        }).toList(),
                      ),
                    )
                  ],
                );
              }

            });
      

  }


  _itemVideo(bloc, v){

    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        background: Container(
          color: Colors.red,
          child: Align(
              alignment: Alignment(-0.9, 0.0),
            child: Icon(Icons.delete_outline, color: Colors.white),
          ),),

        direction: DismissDirection.startToEnd,
        child: Container(
          padding: EdgeInsets.fromLTRB(1.0, 2.0, 1.0, 2.0),
          child:

           Column(
             children: <Widget>[

               Row(
                 children: <Widget>[
                   Container(
                     width: 130,
                     height: 90,
                     child: Image.network(v.thumb),
                   ),
                   Expanded(

                     child: Text(
                       v.title,
                       style: TextStyle(
                           color: Colors.black,
                           fontSize: 12.0,
                           fontWeight: FontWeight.bold),
                       maxLines: 2,
                     ),),
                 ],
               ),
               Divider(height: 5.0,)],)

        ),
      onDismissed: (direction){

        bloc.toggleFavorite(v);

      },);}

}
