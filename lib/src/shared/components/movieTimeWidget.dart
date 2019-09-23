import 'package:flutter/cupertino.dart';

class MovieTimeWidget extends StatelessWidget {

  final data;
  final style;
  
  MovieTimeWidget(this.data, this.style);

  @override
  Widget build(BuildContext context) {
    return Text(
      data.rooms.map((i) {
        var times = [];
        i.sessions.forEach((i) {
          times.add(i.time);
        });
        return times.join(" ");
      }).join(" "),
      style: style,
    );
  }
}
