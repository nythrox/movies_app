import 'package:flutter/material.dart';

class Style {
  get background => Color(0xff14223d);
  get secondaryBackground => Color(0xff25354f);
  get lightDarkBlueBackground => Color(0xff314563);

  get topBarTitle => TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300);
  get title => TextStyle(color: Colors.white, fontSize: 32);
  get movieTitle => TextStyle(color: Colors.white, fontSize: 22);
  get movieGenre => TextStyle(color: Colors.white, fontSize: 14);
  get bookingTitle => TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w300);
  get movieTime => TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600);
  get movieDuration =>  TextStyle(fontSize: 14, color: Color(0xff8fa8d3));
  get bookingText => TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w300);
}
