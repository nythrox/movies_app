import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/src/shared/models/movie_model.dart';

class MovieRepository extends Disposable {
  final String baseUrl =
      "https://api-content.ingresso.com/v0/sessions/city/195/theater/1001?sortBy=time&";
  final dio = Dio();

  Future<List<MovieModel>> getMoviesByDay(String date) async {
    try {
      String url = baseUrl +"date=" +date;
      Response res = await dio.get(url);
      return MovieModel.fromJsonList(res.data[0]["movies"]);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<List<MovieModel>>> getMovies() async {
    String url = baseUrl;
    try {
      Response res = await dio.get(url);
      List<List<MovieModel>> finalList = [];
      res.data.forEach((i){
        finalList.add(MovieModel.fromJsonList(i["movies"]));
      });
      return finalList;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  void dispose() {}
}
