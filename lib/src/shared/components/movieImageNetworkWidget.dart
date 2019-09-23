import 'package:flutter/cupertino.dart';

class MovieImageNetworkWidget extends StatelessWidget {
  final data;
  final String type;
  final double width;
  MovieImageNetworkWidget(this.data,this.type, this.width);

  @override
  Widget build(BuildContext context) {
    try {

    return (
    Image.network(
                        data
                            .where((i) => i.type == this.type)
                            .first
                            .url,
                        width: width)
                      
    );  
    }
    catch (e){
      print(e);
      return Container(margin: EdgeInsets.only(top: 30),child: (Placeholder()));
    }
  }
}
