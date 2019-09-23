import 'package:flutter/material.dart';
import 'package:movies_app/src/app_module.dart';
import 'package:movies_app/src/shared/components/movieGenreWidget.dart';
import 'package:movies_app/src/shared/components/movieHoursWidget.dart';
import 'package:movies_app/src/shared/components/movieImageNetworkWidget.dart';
import 'package:movies_app/src/shared/models/movie_model.dart';
import 'package:movies_app/src/shared/style/Style.dart';

class MovieDetailsPage extends StatefulWidget {
  MovieDetailsPage(this.movie);
  MovieModel movie;
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final style = AppModule.to.getDependency<Style>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: ListView(
              padding: EdgeInsets.only(top: 0),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    MovieImageNetworkWidget(widget.movie.images, "PosterHorizontal", MediaQuery.of(context).size.width),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  color: Color(0xff25354f),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.movie.contentRating, style: style.movieTime),
                      Text(
                        widget.movie.title,
                        style: style.title,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Color(0xfffac530),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xfffac530),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xfffac530),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xfffac530),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xfffac530),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            MovieGenreWidget(widget.movie.genres, style.movieGenre),
                             MovieDurationWidget(widget.movie.duration, style.movieDuration)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: Text("Sinopse", style: style.movieTitle),
                      ),
                      Text(
                          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
                          style: style.bookingText),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: style.lightDarkBlueBackground,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        height: 160,
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 10),
                                    child: Text("Segunda",
                                        style: style.bookingTitle),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("11:50",
                                            style: style.bookingTitle),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("13:20",
                                            style: style.bookingTitle),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: .0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("17:10",
                                            style: style.bookingTitle),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 10),
                                    child:
                                        Text("Terça", style: style.bookingTitle),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("17:50",
                                            style: style.bookingTitle),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("20:50",
                                            style: style.bookingTitle),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: .0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("23:50",
                                            style: style.bookingTitle),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 10),
                                    child:
                                        Text("Quarta", style: style.bookingTitle),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("08:50",
                                            style: style.bookingTitle),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("17:50",
                                            style: style.bookingTitle),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: .0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("21:50",
                                            style: style.bookingTitle),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: style.secondaryBackground,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Immersão",
                                  style: style.movieTitle,
                                )),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: OutlineButton(
                                      borderSide: BorderSide(
                                        color: Colors.white, //Color of the border
                                        style: BorderStyle
                                            .solid, //Style of the border
                                        width: 1.5, //width of the border
                                      ),
                                      onPressed: () {},
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        "2D",
                                        style: style.movieTitle,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: OutlineButton(
                                      borderSide: BorderSide(
                                        color: Colors.white, //Color of the border
                                        style: BorderStyle
                                            .solid, //Style of the border
                                        width: 1.5, //width of the border
                                      ),
                                      onPressed: () {},
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        "3D",
                                        style: style.movieTitle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: FloatingActionButton(
              backgroundColor: style.background,
              child: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
