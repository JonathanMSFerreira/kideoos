import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kideoos/animation/sprite_button.dart';
import 'package:kideoos/blocs/favorite_bloc.dart';
import 'package:kideoos/models/video.dart';
import 'package:kideoos/screens/parents.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:kideoos/utils/background_kideoos.dart';


class Kideoos extends StatefulWidget {
  @override
  _KideoosState createState() => _KideoosState();
}

class _KideoosState extends State<Kideoos> {

  String _idVideoSelecionado = "";

  @override
  void dispose() {
    _idVideoSelecionado = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<FavoriteBloc>(context);



    return Scaffold(

      
      body:  SafeArea(
        child: StreamBuilder<Map<String, Video>>(
          stream: BlocProvider.of<FavoriteBloc>(context).outFav,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isNotEmpty) {
                return Stack(

                  children: <Widget>[

                    _listVideos(context, bloc),

                   
                   Padding(
                     padding: EdgeInsets.all(5),
                     child: Align(

                         alignment: Alignment.topRight,
                         child: GestureDetector(
                           child: Container(
                             height: 50,
                             child: Image.asset("images/oo.png",),

                           ),
                           onLongPress: () {
                             Navigator.of(context).pushReplacement(
                                 MaterialPageRoute(builder: (context) => Parents()));
                           },
                         )))],);

              } else {
                return Scaffold(body: _initialPage());
              }
            } else
              return Container();
          }),
      )

    );
  }

//  _appBar() {
//    return AppBar(
//
//      title: GestureDetector(
//        child: Container(
//          height: 30,
//          child: Image.asset("images/kideoos.png",),
//        ),
//        onLongPress: () {
//          Navigator.of(context).pushReplacement(
//              MaterialPageRoute(builder: (context) => Parents()));
//        },
//      ),
//      backgroundColor: Colors.white,
//    );
//  }

//  Carrega lista de vídeos favoritos
  _listVideos(context, bloc) {
    return Container(

        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.symmetric(vertical: 1),
        child: _idVideoSelecionado != ""
            ? Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                 _videoEmExibicao(bloc),
                _listaFavoritos(bloc)])
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[_listaFavoritos(bloc)]));
  }


  _videoEmExibicao(bloc) {
    return Expanded(
      //  padding: EdgeInsets.only(bottom: 1.0),

      flex: 1,
      child:  Container(


              color: Colors.black,
              child: YoutubePlayer(

                context: context,
                source: _idVideoSelecionado,
                quality: YoutubeQuality.LOW,
                aspectRatio: 11.0 / 8.0,
           //     keepScreenOn: true,
                autoPlay: true,
                onVideoEnded: (){

                  _reproducaoAutomatica(bloc);

                },


              )

          )

    );
  }


  //Retorna um vídeo novo quando terminar a reprodução atual
  _reproducaoAutomatica(bloc){

    StreamBuilder<Map<String, Video>>(
        stream: bloc.outFav,
        initialData: {},
        builder: (context, snapshot) {
          snapshot.data.values.map((v) {

            _getIdVideo(v.id);

          });



        });


  }

  //Atualiza o vídeo a ser exibido no player
  void _getIdVideo(String vi) {

    setState(() {
      _idVideoSelecionado = vi;
    });

  }


  //Método que constroi a lista de reprodução
  _listaFavoritos(bloc) {


    return Expanded(

        child: StreamBuilder<Map<String, Video>>(
          stream: bloc.outFav,
          initialData: {},
          builder: (context, snapshot) {

          return CustomScrollView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,


              slivers: <Widget>[
            SliverList(
            delegate: SliverChildListDelegate(


               snapshot.data.values.map((v) {
                return InkWell(
                    onTap: () {
                      //Atualiza player de vídeo
                        _getIdVideo(v.id);

                    },
                    child: Container(

                      padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 2.0),

                      child: Column(

                        children: <Widget>[

                          Row(
                            children: <Widget>[
                              Container(
                                width: 130,
                                height: 90,
                                child: Image.network(v.thumb),
                              ),
                              Expanded(

                                  child:
                                  Text(
                                    v.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                  )

                              ),
                            ],
                          ),

                          Divider(height: 5,)
                        ],)
                    ));
              }).toList()
            ))]
            );
          }),
    );
  }



  //Carrega página inicial
  _initialPage() {


    return SpriteButton();


  }
}
