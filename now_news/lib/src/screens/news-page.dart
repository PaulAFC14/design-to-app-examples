import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_advanced_networkimage_2/transition.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:now_news/src/reusable/methods/routes.dart';

import '../responsive/responsive-method.dart';

late int responsiveId;
late double vw;
late double vh;
late double ratio;
late double vr;

late StatefulWidget origin;
late bool saved;

class NewsPage extends StatefulWidget {
  late BuildContext context;
  NewsPage(this.context, {super.key, required StatefulWidget originPage}) {
    Map<String, dynamic> responsive =
        ResponsiveData(context: context).getAspectRatio();
    responsiveId = responsive['id'];
    vw = responsive['vw'];
    vh = responsive['vh'];
    ratio = responsive['ratio'];
    vr = vh / ratio;

    origin = originPage;
    saved = false;
  }

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _back() async {
      Routes(context).goTo(origin);

      return false;
    }

    return WillPopScope(
      onWillPop: _back,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: EdgeInsets.only(top: 2.5 * vw),
              width: 100 * vw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100 * vw,
                    height: 9 * vr,
                    padding: EdgeInsets.symmetric(horizontal: 5 * vw),
                    child: header(context),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * vw),
          child: ListView(
            children: [
              SizedBox(height: 5 * vr),
              Text(
                "QB coach says 49ers' Trey Lance needed drastic adjustment to throwing motion, now has Patrick Mahomes' support",
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 5 * vw,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
              SizedBox(height: 2.5 * vr),
              Text(
                'Cody Benjamin    ∙    26 min read',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 2.75 * vw,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5 * vr),
              Container(
                width: double.infinity,
                height: 65 * vw,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(2.5 * vw),
                ),
                child: TransitionToImage(
                  borderRadius: BorderRadius.circular(2.5 * vw),
                  curve: Curves.easeInOutCirc,
                  fit: BoxFit.cover,
                  placeholder: Container(
                    width: 300.0,
                    height: 300.0,
                    color: Colors.transparent,
                    child: Icon(
                      Iconsax.refresh,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  loadingWidgetBuilder: (
                    context,
                    progress,
                    imageData,
                  ) {
                    return Container(
                      width: 20 * vw,
                      height: 20 * (vh / ratio),
                      alignment: Alignment.center,
                      child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Theme.of(context).primaryColor, size: 10 * vw),
                    );
                  },
                  enableRefresh: true,
                  image: AdvancedNetworkImage(
                    'https://static.clubs.nfl.com/image/private/t_editorial_landscape_12_desktop/49ers/zcsbijecvehidosjrkfl',
                    timeoutDuration: const Duration(seconds: 10),
                    retryLimit: 2,
                    /*fallbackAssetImage:
                                                                      'assets/img/banner-cpb.png'*/
                  ),
                ),
              ),
              SizedBox(height: 5 * vr),
              Text(
                "Trey Lance has looked the best the 49ers have ever seen him this offseason, coach Kyle Shanahan said recently. And it turns out the quarterback underwent significant change to catch San Francisco's eye. Private QBs coach Jeff Christensen worked with both Lance and Chiefs star Patrick Mahomes this spring, telling The Athletic the 49ers signal-caller required a drastic adjustment of his throwing motion, and now has a big believer in Mahomes as a result.\n",
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 3.5 * vw,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
              Text(
                "\"Every day (of training) was a substantial jump\" for Lance, Christensen argued, saying the 49ers' former first-round pick made his biggest strides when he was paired up with Mahomes for throwing sessions. Lance's arm \"would become tender\" too quickly, Christensen added, but the issue was corrected by tweaking the QB's technique. Usually it takes a day to diagnose a QB's delivery, he explained, but with Lance, it took four. Eventually, the QB's entire throwing motion became more efficient.\n",
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 3.5 * vw,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
              Text(
                "And Mahomes, the best QB in the entire league, was on hand to witness the transformation.\n\n\"Pat really thinks the world of (Lance),\" Christensen told The Athletic. \"He's just a really good person, conscientious. He wants to be great. And he's one of the few kids whose actions match his words. He backs it up. He shows up every day and he wants to learn. And that's why I teach him.\"",
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 3.5 * vw,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
              Text(
                "It's possible that Lance could still open the 2023 season as the 49ers' starting QB. Fellow youngster Brock Purdy is the perceived front-runner to hold QB1 duties after successfully replacing an injured Jimmy Garoppolo in 2022. However, Purdy is coming off a serious elbow injury, and Shanahan has expressed belief in Lance's ability as a long-term face of the franchise.",
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 3.5 * vw,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 10 * vr),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Routes(context).goTo(origin),
          child: Container(
            width: 9 * vw,
            height: 9 * vr,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: 0.4 * vw,
                )),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Theme.of(context).primaryColorDark,
              size: 4.5 * vw,
            ),
          ),
        ),
        Text(
          'Sports',
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 3 * vw,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              saved = !saved;
            });
          },
          child: Container(
            width: 9 * vw,
            height: 9 * vr,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: 0.4 * vw,
                )),
            child: Icon(
              saved ? Iconsax.archive_minus1 : Iconsax.archive_minus,
              color: Theme.of(context).primaryColorDark,
              size: 4.5 * vw,
            ),
          ),
        ),
      ],
    );
  }
}
