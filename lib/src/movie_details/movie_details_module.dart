  import 'package:movies_app/src/movie_details/movie_details_bloc.dart';
  import 'package:bloc_pattern/bloc_pattern.dart';
  import 'package:flutter/material.dart';
  
  class MovieDetailsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [Bloc((i) => MovieDetailsBloc()),];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<MovieDetailsModule>.of();

}
  