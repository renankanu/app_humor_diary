import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class ActivityIcon extends StatelessWidget {
  String image;
  String name;
  bool isSelected;
  ActivityIcon(this.image, this.name, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              height: 36,
              width: 36,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color:
                isSelected ? CustomColors.gunPowder : CustomColors.forgetMeMot,
            width: 2),
        color: CustomColors.forgetMeMot,
      ),
    );
  }
}
