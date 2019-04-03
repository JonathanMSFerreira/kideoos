import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kideoos/blocs/videos_bloc.dart';
import 'package:kideoos/delegates/data_search.dart';
import 'package:kideoos/screens/selected_videos.dart';
import 'package:kideoos/utils/background_kideoos.dart';
import 'package:kideoos/widgets/videotile.dart';

class ResultSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<VideosBloc>(context);


    final selectedVideos = SelectedVideos();

   Future<Null> _searchVideos() async{

      String result = await showSearch(context: context, delegate: DataSearch());
      if(result != null) bloc.inSearch.add(result);

    }

    return Scaffold(

      appBar: AppBar(

        elevation: 3.0,

        backgroundColor: Colors.yellow,
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search, color: Colors.lightBlue[500],),
            onPressed: () {

              _searchVideos();

            },
          )
        ],
      ),

      body: StreamBuilder(
          stream: bloc.outVideos,
          initialData: [],
          builder: (context, snapshot){
            if(snapshot.hasData)
              return ListView.builder(
                itemBuilder: (context, index){
                  if(index < snapshot.data.length){
                    return VideoTile(snapshot.data[index]);
                  } else if (index > 1){
                    bloc.inSearch.add(null);
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue[500]),),
                    );
                  }

                  else {
                    return Center(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          selectedVideos.build(context)

                        ],
                      ));
                  }
                },
                itemCount: snapshot.data.length + 1,
              );
            else
              return Container();
          }
      ),



    );

  }



}
