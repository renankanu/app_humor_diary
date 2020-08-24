import 'package:app_humor_diary/model/moodcard.dart';
import 'package:app_humor_diary/screen/home/home_screen.dart';
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
      value: MoodCard(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Humor Diary',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: CustomColors.comet,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
