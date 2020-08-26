import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHumorDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: CustomColors.watusi,
              size: 16,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: CustomColors.comet,
        elevation: 0,
        title: Text(
          'My Humor',
          style: TextStyle(color: CustomColors.watusi),
        ),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(arguments['datetime']),
                  Text(arguments['humor']),
                  Image.asset(arguments['image']),
                  Text('Your activities'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          for (var image in arguments['imagesActivities'])
                            Container(
                              height: 60,
                              child: Image.asset(image),
                            ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: <Widget>[
                          for (var item in arguments['descriptionsActivities'])
                            Container(
                              height: 60,
                              child: Center(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: CustomColors.forgetMeMot),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.gunPowder,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: SafeArea(
                  child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Remove this..",
                      style: TextStyle(
                          color: CustomColors.forgetMeMot, fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FaIcon(
                      FontAwesomeIcons.trashAlt,
                      color: CustomColors.forgetMeMot,
                      size: 18,
                    )
                  ],
                ),
              )),
            )
          ]),
    );
  }
}
