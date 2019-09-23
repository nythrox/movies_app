import 'package:flutter/rendering.dart';
import 'package:movies_app/src/home/home_module.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:movies_app/src/movie_details/movie_details_page.dart';
import 'package:movies_app/src/shared/components/movieGenreWidget.dart';
import 'package:movies_app/src/shared/components/movieHoursWidget.dart';
import 'package:movies_app/src/shared/components/movieImageNetworkWidget.dart';
import 'package:movies_app/src/shared/components/movieTimeWidget.dart';
import 'package:movies_app/src/shared/models/movie_model.dart';
import 'package:movies_app/src/shared/style/Style.dart';

import '../app_module.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final style = AppModule.to.getDependency<Style>();
  final moviesBloc = HomeModule.to.bloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.background,
      body: Column(
        children: <Widget>[
          navbar,
          header,
          StreamBuilder<List<List<MovieModel>>>(
              stream: moviesBloc.movieDayStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DefaultTabController(
                      length: snapshot.data.length, //snapshot.data.length
                      child: Expanded(
                          child: Scaffold(
                        backgroundColor: style.background,
                        appBar: PreferredSize(
                          preferredSize: Size.fromHeight(100),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: TabBar(
                                isScrollable: true,
                                indicatorColor: Colors.white,
                                tabs: buildTabsHeader(snapshot)),
                          ),
                        ),
                        body: TabBarView(children: buildTabsBody(snapshot)),
                      )));
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }

  buildTabsHeader(AsyncSnapshot snapshot) {
    List<Widget> tabs = [];
    for (int i = 0; i < snapshot.data.length; i++) {
      tabs.add(Tab(
          child: Text(snapshot.data[i][0].rooms[0].sessions[0].date.dayOfWeek
              .toUpperCase())));
    }
    return tabs;
  }

  buildTabsBody(AsyncSnapshot snapshot) {
    List<Widget> tabs = [];
    for (int i = 0; i < snapshot.data.length; i++) {
      tabs.add(latestMoviesWidget(snapshot.data[i]));
    }
    return tabs;
  }

  get navbar => Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: (Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
              Text("Shopping Hortolândia", style: style.topBarTitle),
            ]),
            Icon(Icons.account_circle, size: 40, color: Colors.white)
          ],
        )),
      );

  get header => Padding(
        padding: const EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Filmes", style: style.title),
            Icon(
              Icons.search,
              color: Colors.white,
              size: 36,
            ),
          ],
        ),
      );

  // get tabs => ;

  // get tabsHeader => ;

  // get tabsBody => ;

  latestMoviesWidget(List<MovieModel> data) {
    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (context, i) {
        return Divider(
          color: Colors.white30,
          height: 1,
        );
      },
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetailsPage(data[i])));
          },
          child: Container(
            color: style.secondaryBackground,
            padding: const EdgeInsets.only(left: 30, top: 30, bottom: 30),
            child: (Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: new BorderRadius.circular(8),
                  child: 
                  MovieImageNetworkWidget(data[i].images, "PosterPortrait", 120)
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MovieTimeWidget(data[i], style.movieTime),
                        Text(
                          data[i].title, //"Spiderman: Far From Home"
                          style: style.movieTitle,
                        ),
                        Row(children: <Widget>[
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
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MovieGenreWidget(data[i].genres, style.movieGenre),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MovieDurationWidget(data[i].duration, style.movieDuration),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
