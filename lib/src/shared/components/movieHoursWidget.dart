import 'package:flutter/cupertino.dart';

class MovieDurationWidget extends StatelessWidget {
  final data;
  final style;

  MovieDurationWidget(this.data, this.style);

  @override
  Widget build(BuildContext context) {
    return Text(
        Duration(minutes: int.parse(data)).inHours.toString() +
            " horas " +
            (Duration(minutes: int.parse(data)).inMinutes % 60)
                .toString() +
            " mins",
        style: style);
  }
}
