import 'package:app_humor_diary/model/humor.dart';
import 'package:app_humor_diary/screen/widgets/humor_icon.dart';
import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String humor;
  String image;
  String datepicked;
  String timepicked;
  String dateonly;
  String datetime;
  int ontapcount = 0;
  List<Humor> humors = [];
  @override
  void initState() {
    super.initState();
    humors = [
      Humor('assets/happy.png', 'Happy', true),
      Humor('assets/happy.png', 'Sad', true),
      Humor('assets/happy.png', 'Angry', true),
      Humor('assets/happy.png', 'Surprised', true),
      Humor('assets/happy.png', 'Loving', true),
      Humor('assets/happy.png', 'Scared', true)
    ];
  }

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
            ),
            SizedBox(height: 40),
            Text(
              "WHAT YOU FEELING NOW?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text('(Tap to Select and Tap again to deselect!)'),
            SizedBox(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: humors.length,
                  itemBuilder: (context, index) {
                    return Row(children: <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: HumorIcon(
                          image: humors[index].image,
                          name: humors[index].name,
                          colour: humors[index].isSelected
                              ? Colors.black
                              : Colors.white,
                        ),
                        onTap: () {
                          if (ontapcount == 0) {
                            setState(() {
                              humor = humors[index].name;
                              image = humors[index].image;
                              humors[index].isSelected = true;
                              ontapcount = ontapcount + 1;
                              print(humor);
                            });
                          } else if (humors[index].isSelected) {
                            setState(() {
                              humors[index].isSelected = false;
                              ontapcount = 0;
                            });
                          }
                        },
                      )
                    ]);
                  }),
            ),
            Text(
              'WHAT YOU HAVE BEEN DOING?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Hold on the activity to select,You can choose multiple',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
