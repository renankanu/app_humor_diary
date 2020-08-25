import 'package:app_humor_diary/helper/db_helper.dart';
import 'package:app_humor_diary/helper/humordata.dart';
import 'package:app_humor_diary/model/humor_card.dart';
import 'package:app_humor_diary/screen/widgets/humor_day_card.dart';
import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MyHumor extends StatefulWidget {
  @override
  _MyHumorState createState() => _MyHumorState();
}

class _MyHumorState extends State<MyHumor> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    isLoading = Provider.of<HumorCard>(context, listen: true).isloading;
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: CustomColors.comet,
              centerTitle: true,
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
            body: FutureBuilder<List>(
              future: DBHelper.getData('user_humors'),
              initialData: List(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, int position) {
                          var imagestring = snapshot.data[position]['actimage'];
                          List<String> img = imagestring.split('_');
                          List<String> name =
                              snapshot.data[position]['actname'].split("_");
                          Provider.of<HumorCard>(context, listen: false)
                              .actiname
                              .addAll(name);
                          Provider.of<HumorCard>(context, listen: false).data.add(HumorData(
                              snapshot.data[position]['humor'] == 'Angry'
                                  ? 1
                                  : snapshot.data[position]['humor'] == 'Happy'
                                      ? 2
                                      : snapshot.data[position]['humor'] == 'Sad'
                                          ? 3
                                          : snapshot.data[position]['humor'] == 'Surprised'
                                              ? 4
                                              : snapshot.data[position]['humor'] == 'Loving'
                                                  ? 5
                                                  : snapshot.data[position]
                                                              ['humor'] ==
                                                          'Scared'
                                                      ? 6
                                                      : 7,
                              snapshot.data[position]['date'],
                              snapshot.data[position]['humor'] == 'Angry'
                                  ? charts.ColorUtil.fromDartColor(Colors.red)
                                  : snapshot.data[position]['humor'] == 'Happy'
                                      ? charts.ColorUtil.fromDartColor(
                                          Colors.blue)
                                      : snapshot.data[position]['humor'] == 'Sad'
                                          ? charts.ColorUtil.fromDartColor(Colors.green)
                                          : snapshot.data[position]['humor'] == 'Surprised' ? charts.ColorUtil.fromDartColor(Colors.pink) : snapshot.data[position]['humor'] == 'Loving' ? charts.ColorUtil.fromDartColor(Colors.purple) : snapshot.data[position]['humor'] == 'Scared' ? charts.ColorUtil.fromDartColor(Colors.black) : charts.ColorUtil.fromDartColor(Colors.white)));

                          return HumorDay(
                              snapshot.data[position]['image'],
                              snapshot.data[position]['datetime'],
                              snapshot.data[position]['humor'],
                              img,
                              name);
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          );
  }
}
