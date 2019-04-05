import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:kideoos/blocs/favorite_bloc.dart';
import 'package:kideoos/models/video.dart';
import 'package:kideoos/api.dart';

class Help extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.indigo,
        elevation: 1.0,
        centerTitle: true,
        title:  Image.asset("images/kideoos.png", height: 200,),

      ),

      body: Container(








      ),
    );
  }
}
