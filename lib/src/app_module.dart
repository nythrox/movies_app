  import 'package:movies_app/src/shared/repositories/movie_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/app_widget.dart';
import 'package:movies_app/src/app_bloc.dart';
import 'package:movies_app/src/shared/style/Style.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
    Bloc((i) => AppBloc()),
  ];

  @override
  List<Dependency> get dependencies => [Dependency((i) => MovieRepository()),
  Dependency((i)=>Style())];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();

}
  