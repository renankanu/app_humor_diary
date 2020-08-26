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
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.gunPowder,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.gunPowder30,
                                spreadRadius: 3,
                                blurRadius: 6,
                                offset:
                                    Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "You were " + arguments['humor'],
                                  style: TextStyle(
                                      color: CustomColors.forgetMeMot,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    arguments['image'],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  arguments['datetime'],
                                  style: TextStyle(
                                      color: CustomColors.forgetMeMot),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Your activities',
                                  style: TextStyle(
                                      color: CustomColors.forgetMeMot,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        for (var image
                                            in arguments['imagesActivities'])
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Container(
                                              height: 24,
                                              child: Image.asset(image),
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        for (var item in arguments[
                                            'descriptionsActivities'])
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Container(
                                              height: 24,
                                              child: Center(
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: CustomColors
                                                          .forgetMeMot),
                                                ),
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
                                    color: CustomColors.forgetMeMot,
                                    fontSize: 18),
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
              ),
            ),
          );
        }));
  }
}
