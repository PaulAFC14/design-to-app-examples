import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_advanced_networkimage_2/transition.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:now_news/src/screens/home-page.dart';
import 'package:now_news/src/screens/news-page.dart';

import '../responsive/responsive-method.dart';
import '../reusable/methods/routes.dart';
import '../reusable/widgets/menu.dart';

late int responsiveId;
late double vw;
late double vh;
late double ratio;
late double vr;

late int page;
late List<String> categories;
late List<dynamic> data;

class PopularPage extends StatefulWidget {
  late BuildContext context;
  PopularPage(this.context, {super.key}) {
    Map<String, dynamic> responsive =
        ResponsiveData(context: context).getAspectRatio();
    responsiveId = responsive['id'];
    vw = responsive['vw'];
    vh = responsive['vh'];
    ratio = responsive['ratio'];
    vr = vh / ratio;

    page = 0;

    categories = [
      'Sports',
      'Politics',
      'Fashion',
      'Moda',
      'Economy',
      'Science',
    ];

    data = [];

    data.add({
      "path":
          "https://static.clubs.nfl.com/image/private/t_editorial_landscape_12_desktop/49ers/zcsbijecvehidosjrkfl",
      "title":
          "QB coach says 49ers' Trey Lance needed drastic adjustment to...",
      "info": "Cody Benjamin    ∙    26 min read",
    });

    data.add({
      "path":
          "https://s.yimg.com/ny/api/res/1.2/tJtuaE6PiRyEsR.hX7YIXw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtjZj13ZWJw/https://s.yimg.com/os/creatr-uploaded-images/2023-05/d1b94f60-f607-11ed-bfff-f5bbbc4746c9",
      "title": "NBA playoffs: LeBron James struggles, tweaks injured foot...",
      "info": "Vincent Goodwill    ∙    14 min read",
    });

    data.add({
      "path":
          "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D942/production/_129781655_gettyimages-1255682185.jpg",
      "title": "Formula 1 to donate 1m euros to relief fund for Emilia...",
      "info": "Andrew Benson    ∙    35 min read",
    });

    data.add({
      "path":
          "https://www.gannett-cdn.com/authoring/2018/01/08/NETN/ghows-PA-624a3d13-70d7-2fb9-e053-0100007f0b9e-6f3d96ac.jpeg",
      "title": "Antonio Brown Says He Wants to Retire with Steelers; Played...",
      "info": "Joe Clark    ∙    41 min read",
    });
  }

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  late var controller;
  final ScrollController _scrollController = ScrollController();

  Future<bool> _back() async {
    Routes(context).goTo(HomePage(context));

    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = SwiperController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + (23 * vw),
      duration: Duration(
          milliseconds: 500), // Duración de la animación de desplazamiento
      curve: Curves.easeInOut, // Curva de interpolación para la animación
    );
  }

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - (23 * vw),
      duration: Duration(
          milliseconds: 500), // Duración de la animación de desplazamiento
      curve: Curves.easeInOut, // Curva de interpolación para la animación
    );
  }

  @override
  Widget build(BuildContext context) {
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
                              color: Theme.of(context).primaryColorDark,
                              size: 4.5 * vw,
                            ),
                          ),
                        ),
                        Text(
                          'Popular',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 3 * vw,
                            fontWeight: FontWeight.bold,
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
                              Iconsax.search_normal_1,
                              color: Theme.of(context).primaryColorDark,
                              size: 4 * vw,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(5 * vw, 5 * vr, 5 * vr, 0),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              if (index == 0) {
                return GestureDetector(
                  onTap: () => Routes(context).goTo(
                      NewsPage(context, originPage: PopularPage(context))),
                  child: Container(
                    height: 97.2 * vr,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 91.7 * vr,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 65 * vr,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.5 * vw),
                                  color: Theme.of(context).primaryColorLight,
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
                                      child: LoadingAnimationWidget
                                          .staggeredDotsWave(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 10 * vw),
                                    );
                                  },
                                  enableRefresh: true,
                                  image: AdvancedNetworkImage(
                                    data[index]['path'],
                                    timeoutDuration:
                                        const Duration(seconds: 10),
                                    retryLimit: 2,
                                    /*fallbackAssetImage:
                                                                          'assets/img/banner-cpb.png'*/
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.5 * vr),
                              Container(
                                width: double.infinity,
                                height: 21.7 * vr,
                                //color: Colors.green,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['title'],
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        fontSize: 5 * vw,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      data[index]['info'],
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 2.75 * vw,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.5 * vr,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        SizedBox(height: 5 * vr),
                      ],
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => Routes(context).goTo(
                          NewsPage(context, originPage: PopularPage(context))),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5 * vr),
                        color: Colors.white,
                        height: 27.2 * vr,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 21.7 * vr,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30 * vw,
                                    height: 21.7 * vr,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius:
                                          BorderRadius.circular(2.5 * vw),
                                    ),
                                    child: TransitionToImage(
                                      borderRadius:
                                          BorderRadius.circular(2.5 * vw),
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
                                          child: LoadingAnimationWidget
                                              .staggeredDotsWave(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 10 * vw),
                                        );
                                      },
                                      enableRefresh: true,
                                      image: AdvancedNetworkImage(
                                        data[index]['path'],
                                        timeoutDuration:
                                            const Duration(seconds: 10),
                                        retryLimit: 2,
                                        /*fallbackAssetImage:
                                                                        'assets/img/banner-cpb.png'*/
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.85 * vr),
                                    width: 55 * vw,
                                    height: 21.7 * vr,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index]['title'],
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                            fontSize: 3.5 * vw,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          data[index]['info'],
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 2.75 * vw,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.5 * vr),
                            Container(
                              width: double.infinity,
                              height: 0.5 * vr,
                              color: Theme.of(context).primaryColorLight,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (index == 3) ? 19 * vr : 0,
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
