import 'dart:collection';

import 'package:intl/intl.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:movies_app/src/shared/models/movie_model.dart';
import 'package:movies_app/src/shared/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../app_module.dart';

class HomeBloc extends BlocBase {
  final _movieRepository = AppModule.to.get<MovieRepository>();

  final _moviesController = BehaviorSubject<List<MovieModel>>();
  get moviesSink => _moviesController.sink.add;
  get moviesStream => _moviesController.stream;


  //in the future i want each tab and all of its content to be generated by this list
  final _movieDaysController = BehaviorSubject<List<List<MovieModel>>>(); 
  // [segunda[MovieModel, MovieModel], terça[MovieModel, MovieModel]]
  get movieDaySink => _movieDaysController.sink.add;
  get movieDayStream => _movieDaysController.stream;

  HomeBloc() {
    this.getTodayMovies();
    // this.getMovieDays();
    this.getMovies();
  }

  getTodayMovies() async {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    moviesSink(await _movieRepository.getMoviesByDay(date));
  }

  getMovies() async {
    // movieDaySink(await _movieRepository.getMovies());
    movieDaySink(await _movieRepository.getMovies());
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _movieDaysController.close();
    _moviesController.close();
    super.dispose();
  }
}
