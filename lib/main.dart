import 'package:chairil/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

import 'core/app/app.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle( 
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Person Manage',
      navigatorKey: navGK,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: Constant.avenirRegular
      ),
      home: HomePage()
    );
  }
}