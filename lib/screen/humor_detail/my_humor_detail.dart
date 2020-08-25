import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenArguments {
  String datetime;
  String humor;
  String image;
  List<String> a;
  List<String> b;

  ScreenArguments(this.datetime, this.humor, this.image, this.a, this.b);
}

class MyHumorDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) print(arguments['datetime']);
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: CustomColors.forgetMeMot,
              size: 16,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: CustomColors.comet,
        elevation: 0,
        title: Text('My Humor' + arguments['humor']),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
