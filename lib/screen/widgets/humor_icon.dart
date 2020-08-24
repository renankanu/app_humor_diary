import 'package:flutter/cupertino.dart';

class HumorIcon extends StatelessWidget {
  String image;
  String name;
  Color colour;
  HumorIcon({this.name, this.image, this.colour});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 36,
            width: 36,
          ),
          Text(name)
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: colour),
      ),
      width: 100,
      height: 100,
    );
  }
}
