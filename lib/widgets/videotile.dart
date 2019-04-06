import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:kideoos/api.dart';
import 'package:kideoos/blocs/favorite_bloc.dart';
import 'package:kideoos/models/video.dart';

class VideoTile extends StatelessWidget {
  
  final Video video;
  
  VideoTile(this.video);
  
  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<FavoriteBloc>(context);

    return GestureDetector(
      onTap: (){
        FlutterYoutube.playYoutubeVideoById(
            apiKey: API_KEY,
            videoId: video.id
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[


            Row(
              children: <Widget>[

                Container(

                  padding: EdgeInsets.only(left: 3.0),
                  height: 80,
                  width: 100,
                  child: Image.network(video.thumb, fit: BoxFit.cover,),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          video.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          video.channel,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                StreamBuilder<Map<String, Video>>(
                  stream: bloc.outFav,
                  builder: (context, snapshot){
                    if(snapshot.hasData)
                      return IconButton(
                        icon: Icon(snapshot.data.containsKey(video.id) ?
                        Icons.check_circle_outline : Icons.add_circle),
                        color: snapshot.data.containsKey(video.id) ?   Colors.green:  Colors.indigo,
                        iconSize: 40,
                        onPressed: (){
                          bloc.toggleFavorite(video);
                        },
                      );
                    else
                      return CircularProgressIndicator();
                  },
                )
              ],
            ),

            Divider(height: 2,)



          ],
        ),
      ),
    );
  }
}
