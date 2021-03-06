import 'package:app_humor_diary/model/activity.dart';
import 'package:app_humor_diary/model/humor.dart';
import 'package:app_humor_diary/model/humor_card.dart';
import 'package:app_humor_diary/screen/widgets/activity_icon.dart';
import 'package:app_humor_diary/screen/widgets/custom_modal.dart';
import 'package:app_humor_diary/screen/widgets/humor_icon.dart';
import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  String humor;
  String image;
  String datepicked;
  String timepicked;
  String dateonly;
  String datetime;
  int ontapcount = 0;
  List<Humor> humors = [];
  List<Activity> activities = [];

  @override
  void initState() {
    humors = [
      Humor('assets/happy.png', 'Happy', false),
      Humor('assets/sad.png', 'Sad', false),
      Humor('assets/angry.png', 'Angry', false),
      Humor('assets/surprised.png', 'Surprised', false),
      Humor('assets/loving.png', 'Loving', false),
      Humor('assets/feared.png', 'Scared', false)
    ];
    activities = [
      Activity('assets/sport.png', 'Sports', false),
      Activity('assets/sleeping.png', 'Sleep', false),
      Activity('assets/shop.png', 'Shop', false),
      Activity('assets/relax.png', 'Relax', false),
      Activity('assets/read.png', 'Read', false),
      Activity('assets/movies.png', 'Movies', false),
      Activity('assets/gaming.png', 'Gaming', false),
      Activity('assets/celebrate.png', 'Drink', false),
      Activity('assets/music.png', 'Music', false),
      Activity('assets/exercise.png', 'Excercise', false),
      Activity('assets/eat.png', 'Eat', false),
      Activity('assets/date.png', 'Date', false),
      Activity('assets/clean.png', 'Clean', false)
    ];
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  void callModal(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomModal(message: message);
        });
  }

  void clearValues() {
    humor = null;
    image = null;
    datepicked = null;
    timepicked = null;
    dateonly = null;
    datetime = null;
    ontapcount = 0;
    humors = [
      Humor('assets/happy.png', 'Happy', false),
      Humor('assets/sad.png', 'Sad', false),
      Humor('assets/angry.png', 'Angry', false),
      Humor('assets/surprised.png', 'Surprised', false),
      Humor('assets/loving.png', 'Loving', false),
      Humor('assets/feared.png', 'Scared', false)
    ];
    activities = [
      Activity('assets/sport.png', 'Sports', false),
      Activity('assets/sleeping.png', 'Sleep', false),
      Activity('assets/shop.png', 'Shop', false),
      Activity('assets/relax.png', 'Relax', false),
      Activity('assets/read.png', 'Read', false),
      Activity('assets/movies.png', 'Movies', false),
      Activity('assets/gaming.png', 'Gaming', false),
      Activity('assets/celebrate.png', 'Drink', false),
      Activity('assets/music.png', 'Music', false),
      Activity('assets/exercise.png', 'Excercise', false),
      Activity('assets/eat.png', 'Eat', false),
      Activity('assets/date.png', 'Date', false),
      Activity('assets/clean.png', 'Clean', false)
    ];
    Provider.of<HumorCard>(context, listen: false).clear();
  }

  bool checkHumor() {
    if ((humors.singleWhere((it) => it.isSelected == true,
            orElse: () => null)) !=
        null) {
      return true;
    }
    return false;
  }

  bool checkActivities() {
    if ((activities.singleWhere((it) => it.selected == true,
            orElse: () => null)) !=
        null) {
      return true;
    }
    return false;
  }

  void validHumor() {
    if (datetime == null) {
      callModal(context, 'Select date and time.');
      return;
    }
    if (!checkHumor()) {
      callModal(context, 'Select your mood.');
      return;
    }
    if (!checkActivities()) {
      callModal(context, 'Select at least one activity.');
      return;
    }
    setState(() {
      Provider.of<HumorCard>(context, listen: false).addPlace(
          datetime,
          humor,
          image,
          Provider.of<HumorCard>(context, listen: false)
              .activityimage
              .join('_'),
          Provider.of<HumorCard>(context, listen: false).activityname.join('_'),
          dateonly);
    });
    clearValues();
    Navigator.of(context).pushNamed('/my_humor');
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
            icon: FaIcon(
              FontAwesomeIcons.listUl,
              color: CustomColors.watusi,
            ),
            onPressed: () {
              clearValues();
              Navigator.of(context).pushNamed('/my_humor');
            },
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
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Choose date and time",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
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
                                    timepicked =
                                        time.format(context).toString();
                                  })
                                }),
                      ),
                      RawMaterialButton(
                        fillColor: CustomColors.comet,
                        splashColor: CustomColors.gunPowder,
                        onPressed: () {
                          if (datepicked != null && timepicked != null) {
                            setState(() {
                              datetime = datepicked + '   ' + timepicked;
                            });
                            return;
                          }
                          callModal(context, 'Select date and time.');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.check,
                                size: 16,
                                color: CustomColors.forgetMeMot,
                              ),
                            ),
                          ),
                        ),
                        constraints:
                            BoxConstraints(minWidth: 36, minHeight: 36),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "How are you feeling?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 26),
                SizedBox(
                  height: 90,
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
                                  isSelected: humors[index].isSelected),
                              onTap: () => {
                                    if (ontapcount == 0)
                                      {
                                        setState(() {
                                          humor = humors[index].name;
                                          image = humors[index].image;
                                          humors[index].isSelected = true;
                                          ontapcount = ontapcount + 1;
                                          print(humor);
                                        }),
                                      }
                                    else if (humors[index].isSelected)
                                      {
                                        setState(() {
                                          humors[index].isSelected = false;
                                          ontapcount = 0;
                                        })
                                      }
                                  }),
                        ]);
                      }),
                ),
                SizedBox(height: 32),
                Text(
                  'What are you doing ?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'You can choose multiple',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 26),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: activities.length,
                      itemBuilder: (BuildContext nContext, index) {
                        return Row(
                          children: <Widget>[
                            SizedBox(
                              width: 7.5,
                            ),
                            GestureDetector(
                                child: ActivityIcon(
                                    activities[index].image,
                                    activities[index].name,
                                    activities[index].selected),
                                onTap: () => {
                                      if (activities[index].selected)
                                        {
                                          setState(() {
                                            activities[index].selected = false;
                                            Provider.of<HumorCard>(context,
                                                    listen: false)
                                                .remove(activities[index]);
                                          })
                                        }
                                      else
                                        setState(() {
                                          activities[index].selected = true;
                                          Provider.of<HumorCard>(context,
                                                  listen: false)
                                              .add(activities[index]);
                                        }),
                                    }),
                            SizedBox(
                              width: 7.5,
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.gunPowder,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: SafeArea(
                  child: Container(
                    height: 60,
                    child: GestureDetector(
                      onTap: () => {validHumor()},
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Save Me!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: CustomColors.forgetMeMot,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            FaIcon(
                              FontAwesomeIcons.archive,
                              color: CustomColors.forgetMeMot,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
