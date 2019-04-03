import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kideoos/blocs/favorite_bloc.dart';
import 'package:kideoos/blocs/videos_bloc.dart';
import 'package:kideoos/screens/kideoos.dart';
import 'package:kideoos/animation/sprite_painter.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: VideosBloc(),
        child: BlocProvider(
          bloc: FavoriteBloc(),
          child: MaterialApp(
            title: 'Kideoos',
            debugShowCheckedModeBanner: false,
            home: Kideoos(),
          ),
        )
    );
  }
}
