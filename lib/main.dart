import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'themes/default.theme.dart';
import 'views/home/home.responsive.dart';

void main(){
  runApp(MyApp());
}
// Called when Doing Background Work initiated from Widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Beatus',
      home: Home(),
      theme: DefaultTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}