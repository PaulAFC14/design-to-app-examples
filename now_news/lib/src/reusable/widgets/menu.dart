import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:now_news/src/reusable/methods/routes.dart';
import 'package:now_news/src/screens/categories-page.dart';
import 'package:now_news/src/screens/home-page.dart';

import '../../responsive/responsive-method.dart';

late int responsiveId;
late double vw;
late double vh;
late double ratio;
late double vr;

late int index;

class Menu extends StatefulWidget {
  late BuildContext context;
  Menu(this.context, {super.key, required int page}) {
    Map<String, dynamic> responsive =
        ResponsiveData(context: context).getAspectRatio();
    responsiveId = responsive['id'];
    vw = responsive['vw'];
    vh = responsive['vh'];
    ratio = responsive['ratio'];
    vr = vh / ratio;

    index = page;
  }

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.75 * vw),
      margin: EdgeInsets.fromLTRB(5 * vw, 0, 5 * vw, 2.5 * vw),
      width: 90 * vw,
      height: 13.5 * vr,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 40, 40, 40),
          borderRadius: BorderRadius.circular(13.5 * vw)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Routes(context).goTo(HomePage(context)),
            child: Container(
              width: 13.5 * vw,
              height: 13.5 * vr,
              //color: Colors.pink,
              child: Icon(
                Iconsax.home_2,
                color: (index == 0)
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).unselectedWidgetColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Routes(context).goTo(CategoriesPage(context)),
            child: Container(
              width: 13.5 * vw,
              height: 13.5 * vr,
              //color: Colors.pink,
              child: Icon(
                Iconsax.document,
                color: (index == 1)
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).unselectedWidgetColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Routes(context),
            child: Container(
              width: 13.5 * vw,
              height: 13.5 * vr,
              //color: Colors.pink,
              child: Icon(
                Iconsax.setting_2,
                color: (index == 2)
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).unselectedWidgetColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
