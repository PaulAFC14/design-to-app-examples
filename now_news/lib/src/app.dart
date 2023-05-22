import 'package:flutter/material.dart';
import 'package:now_news/main.dart';
import 'package:now_news/src/screens/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromARGB(255, 255, 255, 255),
        primaryColorDark: Color.fromARGB(255, 40, 40, 40),
        primaryColor: Color.fromARGB(255, 190, 190, 190),
        primaryColorLight: Color.fromARGB(255, 245, 245, 245),
        unselectedWidgetColor: Color.fromARGB(255, 130, 130, 130),
        highlightColor: Color.fromARGB(255, 240, 102, 39),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(context),
      },
    );
  }
}
