import 'package:flutter/cupertino.dart';

class MovieGenreWidget extends StatelessWidget {
  final data;
  final style;

  MovieGenreWidget(this.data, this.style);

  @override
  Widget build(BuildContext context) {
    return Text(data.join(" - "), //"Action - Adventure - Superhero"
        style: style);
  }
}
