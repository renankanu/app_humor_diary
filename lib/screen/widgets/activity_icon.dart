import 'package:flutter/material.dart';

class ActivityIcon extends StatelessWidget {
  String image;
  String name;
  Color colour;
  ActivityIcon(this.image, this.name, this.colour);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
        ),
        decoration: BoxDecoration(
          border: Border.all(color: colour),
        ));
  }
}
