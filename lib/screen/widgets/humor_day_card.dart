import 'package:app_humor_diary/model/humor_card.dart';
import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(
            margin: EdgeInsets.only(left: 5), child: Text("Deleting entry...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class HumorDay extends StatefulWidget {
  String datetime;
  String humor;
  String image;
  List<String> imagesActivities;
  List<String> descriptionsActivities;

  HumorDay(this.image, this.datetime, this.humor, this.imagesActivities,
      this.descriptionsActivities);

  @override
  _HumorDayState createState() => _HumorDayState();
}

class _HumorDayState extends State<HumorDay> {
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 138,
        child: GestureDetector(
          onTap: () => {
            Navigator.of(context).pushNamed('/my_humor_detail', arguments: {
              'datetime': widget.datetime,
              'humor': widget.humor,
              'image': widget.image,
              'imagesActivities': widget.imagesActivities,
              'descriptionsActivities': widget.descriptionsActivities
            })
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset(widget.image),
                    height: 32,
                    width: 32,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Are you feeling: " + widget.humor,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.calendar,
                        color: CustomColors.comet,
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.datetime ?? 'no date',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
