import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kideoos/utils/background_kideoos.dart';



class DataSearch extends SearchDelegate<String> {

  @override
  ThemeData appBarTheme(BuildContext context) {

    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.blueAccent,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,textTheme: theme.textTheme.copyWith(
        title: theme.textTheme.title.copyWith(
          color: Colors.white,
          // decorationColor: Colors.white,
       )
    ),
    //  dialogBackgroundColor: Colors.yellow,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        color: Colors.white,
      ),
      onPressed: (){
     //   close(context, null);



        Navigator.of(context).popUntil((
                (Route<dynamic> r) =>  r.isFirst));



      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    Future.delayed(Duration.zero).then((_)=>close(context, query));
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final backgroundKideoos  =  BackgroundKideoos();
   
    if(query.isEmpty)
      return

        Stack(

            children: <Widget>[

            backgroundKideoos.setBackKideoos(255,190,255,1,155,255,255,1),


        Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Icon(Icons.search, size: 110.0, color: Colors.blueAccent,),
            Text("Nenhum resultado", style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),)


          ],)

        
      )]);
    else
      return FutureBuilder<List>(
        future: suggestions(query),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(snapshot.data[index]),
                  leading: Icon(Icons.play_circle_filled, color: Colors.red[600],),
                  onTap: (){
                    close(context, snapshot.data[index]);
                  },

                );

              },
              itemCount: snapshot.data.length,
            );
          }
        },
      );
  }

  Future<List> suggestions(String search) async {

    http.Response response = await http.get(
        "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"
    );

    if(response.statusCode == 200){
      return json.decode(response.body)[1].map((v){
        return v[0];
      }).toList();
    } else {
      throw Exception("Falha ao carregar lista de vídeos");
    }

  }



}

