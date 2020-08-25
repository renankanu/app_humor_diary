import 'package:app_humor_diary/helper/db_helper.dart';
import 'package:app_humor_diary/model/humor.dart';
import 'package:flutter/cupertino.dart';

import 'activity.dart';

class HumorCard extends ChangeNotifier {
  String datetime;
  String mood;
  List<String> activityname = [];
  List<String> activityimage = [];
  String image;
  String actimage;
  String actname;
  HumorCard(
      {this.actimage, this.actname, this.datetime, this.image, this.mood});
  List items;
  List<Humor> data = [];
  String date;
  bool isloading = false;
  List<String> actiname = [];

  void add(Activity act) {
    activityimage.add(act.image);
    activityname.add(act.name);
  }

  notifyListeners();

  Future<void> addPlace(String datetime, String humor, String image,
      String actimage, String actname, String date) async {
    DBHelper.insert('user_humors', {
      'datetime': datetime,
      'humor': humor,
      'image': image,
      'actimage': actimage,
      'actname': actname,
      'date': date
    });
    notifyListeners();
  }

  Future<void> deletePlaces(String datetime) async {
    DBHelper.delete(datetime);
    notifyListeners();
  }
}
