import 'package:app_humor_diary/model/humor_card.dart';
import 'package:app_humor_diary/screen/home/home_screen.dart';
import 'package:app_humor_diary/screen/humor/my_humor.dart';
import 'package:app_humor_diary/screen/humor_detail/my_humor_detail.dart';
import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HumorCard(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Humor Diary',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: CustomColors.comet,
            fontFamily: 'Quicksand'),
        home: HomeScreen(),
        routes: {
          '/my_humor': (ctx) => MyHumor(),
          '/my_humor_detail': (ctx) => MyHumorDetail(),
        },
      ),
    );
  }
}
