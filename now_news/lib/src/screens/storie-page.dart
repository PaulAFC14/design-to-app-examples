import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_advanced_networkimage_2/transition.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:now_news/src/screens/home-page.dart';

import '../responsive/responsive-method.dart';
import '../reusable/methods/routes.dart';

late int responsiveId;
late double vw;
late double vh;
late double ratio;
late double vr;

class StoriePage extends StatefulWidget {
  late BuildContext context;
  StoriePage(this.context, {super.key}) {
    Map<String, dynamic> responsive =
        ResponsiveData(context: context).getAspectRatio();
    responsiveId = responsive['id'];
    vw = responsive['vw'];
    vh = responsive['vh'];
    ratio = responsive['ratio'];
    vr = vh / ratio;
  }

  @override
  State<StoriePage> createState() => _StoriePageState();
}

class _StoriePageState extends State<StoriePage> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _back() async {
      Routes(context).goTo(HomePage(context));

      return false;
    }

    return WillPopScope(
      onWillPop: _back,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(7.5 * vh), // here the desired height
            child: Container(
              margin: EdgeInsets.fromLTRB(5 * vw, 5 * vr, 5 * vr, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Routes(context).goTo(HomePage(context)),
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
                        color: Theme.of(context).primaryColorLight,
                        size: 4.5 * vw,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
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
                        Icons.more_vert_rounded,
                        color: Theme.of(context).primaryColorLight,
                        size: 4.5 * vw,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          extendBodyBehindAppBar: true,
          body: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return item(
                context,
                img:
                    "https://www.gannett-cdn.com/authoring/2018/01/08/NETN/ghows-PA-624a3d13-70d7-2fb9-e053-0100007f0b9e-6f3d96ac.jpeg",
                titile:
                    "Antonio Brown Says He Wants to Retire with Steelers; Played 9 Seasons with PIT",
                info: "Joe Clark    ∙    26 min read",
              );
            },
            autoplay: true,
            duration: 10000,
            autoplayDelay: 20000,
            itemCount: 3,
            pagination: SwiperCustomPagination(
              builder: (context, config) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 2.5 * vh),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          config.itemCount,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            width: index == config.activeIndex
                                ? (50 * vw) / config.itemCount
                                : (50 * vw) / config.itemCount,
                            height: index == config.activeIndex
                                ? 0.5 * vh
                                : 0.5 * vh,
                            decoration: BoxDecoration(
                              color: index == config.activeIndex
                                  ? Theme.of(context).highlightColor
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget item(
    BuildContext context, {
    required String img,
    required String titile,
    required String info,
  }) {
    return Stack(
      children: [
        Container(
          width: 100 * vw,
          height: double.infinity,
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
              img,
              timeoutDuration: const Duration(seconds: 10),
              retryLimit: 2,
              /*fallbackAssetImage:
                                                                      'assets/img/banner-cpb.png'*/
            ),
          ),
        ),
        Container(
          width: 100 * vw,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100 * vw,
                height: 45 * vh,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(245, 0, 0, 0),
                    Color.fromARGB(235, 0, 0, 0),
                    Color.fromARGB(225, 0, 0, 0),
                    Color.fromARGB(215, 0, 0, 0),
                    Color.fromARGB(205, 0, 0, 0),
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(180, 0, 0, 0),
                    Color.fromARGB(160, 0, 0, 0),
                    Color.fromARGB(140, 0, 0, 0),
                    Color.fromARGB(120, 0, 0, 0),
                    Color.fromARGB(100, 0, 0, 0),
                    Color.fromARGB(80, 0, 0, 0),
                    Color.fromARGB(60, 0, 0, 0),
                    Color.fromARGB(40, 0, 0, 0),
                    Color.fromARGB(20, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                )),
              ),
              Container(
                width: 100 * vw,
                height: 45 * vh,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(245, 0, 0, 0),
                    Color.fromARGB(235, 0, 0, 0),
                    Color.fromARGB(225, 0, 0, 0),
                    Color.fromARGB(215, 0, 0, 0),
                    Color.fromARGB(205, 0, 0, 0),
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(180, 0, 0, 0),
                    Color.fromARGB(160, 0, 0, 0),
                    Color.fromARGB(140, 0, 0, 0),
                    Color.fromARGB(120, 0, 0, 0),
                    Color.fromARGB(100, 0, 0, 0),
                    Color.fromARGB(80, 0, 0, 0),
                    Color.fromARGB(60, 0, 0, 0),
                    Color.fromARGB(40, 0, 0, 0),
                    Color.fromARGB(20, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                )),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5 * vw, 0, 5 * vw, (3.5 * vh) + 10 * vw),
          width: 100 * vw,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100 * vw,
                height: 9 * vw,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titile,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 5 * vw,
                      fontWeight: FontWeight.w600,
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: 2.5 * vr),
                  Text(
                    info,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 2.75 * vw,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
