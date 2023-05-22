import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:now_news/src/reusable/methods/routes.dart';
import 'package:now_news/src/screens/home-page.dart';

import '../responsive/responsive-method.dart';

late int responsiveId;
late double vw;
late double vh;
late double ratio;
late double vr;

class Splash extends StatefulWidget {
  late BuildContext context;
  Splash(this.context, {super.key}) {
    Map<String, dynamic> responsive =
        ResponsiveData(context: context).getAspectRatio();
    responsiveId = responsive['id'];
    vw = responsive['vw'];
    vh = responsive['vh'];
    ratio = responsive['ratio'];
    vr = vh / ratio;
  }

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2))
        .then((value) => {Routes(context).goTo(HomePage(context))});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
