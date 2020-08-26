import 'package:app_humor_diary/model/humor_card.dart';
import 'package:flutter/material.dart';
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
        height: 100,
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
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Image.asset(widget.image),
                        height: 45,
                        width: 45,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 10),
                                Text(
                                  widget.humor,
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  widget.datetime ?? 'nothing',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(width: 30),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.imagesActivities.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                              widget.imagesActivities[index]),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      widget.descriptionsActivities.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            widget.descriptionsActivities[
                                                    index] ??
                                                'nothinng',
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ]),
                    ],
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            Provider.of<HumorCard>(context, listen: false)
                                .isloading = true;
                            await Provider.of<HumorCard>(context, listen: false)
                                .deletePlaces(widget.datetime);
                            Provider.of<HumorCard>(context, listen: false)
                                .isloading = false;
                          }))
                ],
              ),
            ),
          ),
        ));
  }
}
