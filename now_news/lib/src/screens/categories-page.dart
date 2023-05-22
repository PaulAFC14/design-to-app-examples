import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_advanced_networkimage_2/transition.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:now_news/src/reusable/methods/routes.dart';
import 'package:now_news/src/screens/news-page.dart';

import '../responsive/responsive-method.dart';
import '../reusable/widgets/menu.dart';

late int responsiveId;
late double vw;
late double vh;
late double ratio;
late double vr;

late int page;
late List<String> categories;
late List<dynamic> data;

class CategoriesPage extends StatefulWidget {
  late BuildContext context;
  CategoriesPage(this.context, {super.key}) {
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
          "QB coach says 49ers' Trey Lance needed drastic adjustment to throwing motion, now has...",
      "info": "Cody Benjamin    ∙    26 min read",
    });

    data.add({
      "path":
          "https://s.yimg.com/ny/api/res/1.2/tJtuaE6PiRyEsR.hX7YIXw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtjZj13ZWJw/https://s.yimg.com/os/creatr-uploaded-images/2023-05/d1b94f60-f607-11ed-bfff-f5bbbc4746c9",
      "title":
          "NBA playoffs: LeBron James struggles, tweaks injured foot as Lakers' optimistic plan starts...",
      "info": "Vincent Goodwill    ∙    14 min read",
    });

    data.add({
      "path":
          "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D942/production/_129781655_gettyimages-1255682185.jpg",
      "title":
          "Formula 1 to donate 1m euros to relief fund for Emilia-Romagna flooding",
      "info": "Andrew Benson    ∙    35 min read",
    });

    data.add({
      "path":
          "https://www.gannett-cdn.com/authoring/2018/01/08/NETN/ghows-PA-624a3d13-70d7-2fb9-e053-0100007f0b9e-6f3d96ac.jpeg",
      "title":
          "Antonio Brown Says He Wants to Retire with Steelers; Played 9 Seasons with PIT",
      "info": "Joe Clark    ∙    41 min read",
    });
  }

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late var controller;
  final ScrollController _scrollController = ScrollController();

  Future<bool> _back() async {
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
    controller.dispose();
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
        floatingActionButton: Menu(context, page: 1),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              width: 100 * vw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 95 * vw,
                    height: 7 * vr,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.move(index);
                              page = index;
                            });
                          },
                          child: Container(
                            width: 18 * vw,
                            height: 7 * vr,
                            margin: EdgeInsets.only(right: 5 * vw),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7 * vr),
                              color: (page == index)
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).canvasColor,
                              border: (page == index)
                                  ? null
                                  : Border.all(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      width: 0.4 * vw,
                                    ),
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  color: (page == index)
                                      ? Theme.of(context).canvasColor
                                      : Theme.of(context).primaryColorDark,
                                  fontSize: 2.75 * vw,
                                  fontWeight: FontWeight.normal,
                                  height: 0,
                                  //backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Swiper(
          controller: controller,
          onIndexChanged: (value) {
            setState(() {
              if (page > value) {
                scrollLeft();
              } else {
                scrollRight();
              }
              page = value;
            });
          },
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100 * vw,
              height: 100 * vh,
              padding: EdgeInsets.fromLTRB(5 * vw, 5 * vr, 5 * vw, 0),
              color: Theme.of(context).canvasColor,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => Routes(context).goTo(NewsPage(context,
                            originPage: CategoriesPage(context))),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5 * vr),
                          height: 38 * vr,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 37.5 * vr,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 3 * vr,
                                      child: Text(
                                        'SPORTS $page',
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).highlightColor,
                                          fontSize: 3 * vw,
                                          fontWeight: FontWeight.bold,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(right: 5 * vw),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5 * vr),
                                          width: 55 * vw,
                                          height: 34.5 * vr,
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
                                                  fontSize: 3.75 * vw,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                data[index]['info'],
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 2.75 * vw,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 30 * vw,
                                          height: 34.5 * vr,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 30 * vw,
                                                height: 21.7 * vr,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.5 * vw),
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                ),
                                                child: TransitionToImage(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.5 * vw),
                                                  curve: Curves.easeInOutCirc,
                                                  fit: BoxFit.cover,
                                                  placeholder: Container(
                                                    width: 300.0,
                                                    height: 300.0,
                                                    color: Colors.transparent,
                                                    child: Icon(
                                                      Iconsax.refresh,
                                                      color: Theme.of(context)
                                                          .primaryColor,
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
                                                      alignment:
                                                          Alignment.center,
                                                      child: LoadingAnimationWidget
                                                          .staggeredDotsWave(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              size: 10 * vw),
                                                    );
                                                  },
                                                  enableRefresh: true,
                                                  image: AdvancedNetworkImage(
                                                    data[index]['path'],
                                                    timeoutDuration:
                                                        const Duration(
                                                            seconds: 10),
                                                    retryLimit: 2,
                                                    /*fallbackAssetImage:
                                                                        'assets/img/banner-cpb.png'*/
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 2.5 * vr),
                                              Container(
                                                width: 30 * vw,
                                                height: 6 * vr,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      child: Container(
                                                        width: 6 * vw,
                                                        height: 6 * vr,
                                                        child: Icon(
                                                          Iconsax.archive_minus,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          size: 4.5 * vw,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 3 * vr),
                                                    GestureDetector(
                                                      child: Container(
                                                        width: 6 * vw,
                                                        height: 6 * vr,
                                                        child: Icon(
                                                          Icons
                                                              .more_horiz_rounded,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          size: 4.5 * vw,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
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
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
