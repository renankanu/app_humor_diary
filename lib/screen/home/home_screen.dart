import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String datepicked;
  String timepicked;
  String dateonly;
  String datetime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.comet,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: CustomColors.watusi,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.watusi,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                    color: CustomColors.forgetMeMot,
                    icon: FaIcon(
                      FontAwesomeIcons.calendar,
                      color: CustomColors.comet,
                    ),
                    label: Text(
                      datepicked == null ? 'Pick a date' : datepicked,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: CustomColors.comet),
                    ),
                    onPressed: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2099),
                    ).then((date) => {
                          setState(() {
                            datepicked = date.day.toString() +
                                '-' +
                                date.month.toString() +
                                '-' +
                                date.year.toString();
                            dateonly = date.day.toString() +
                                '/' +
                                date.month.toString();
                          }),
                        }),
                  ),
                  FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                    color: CustomColors.forgetMeMot,
                    icon: FaIcon(
                      FontAwesomeIcons.clock,
                      color: CustomColors.comet,
                    ),
                    label: Text(
                      timepicked == null ? 'Pick a Time' : timepicked,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: CustomColors.comet),
                    ),
                    onPressed: () => showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((time) => {
                              setState(() {
                                timepicked = time.format(context).toString();
                              })
                            }),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: CustomColors.gunPowder,
                    ),
                    child: Icon(
                      Icons.done,
                      color: CustomColors.forgetMeMot,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
