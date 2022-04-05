import 'package:beatus/views/error/error.responsive.dart';
import 'package:core/locator.dart';
import 'package:core/services/messenger.service.dart';
import 'package:core/services/navigator.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'themes/default.theme.dart';

import 'views/home/home.view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector.setupInjector();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorView(error: details.exception.toString());
  };
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
      navigatorKey: dependency<NavigatorService>().navigatorKey,
      scaffoldMessengerKey: dependency<MessengerService>().messengerKey,
      home: Home(),
      theme: DefaultTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}