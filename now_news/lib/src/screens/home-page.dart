import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_advanced_networkimage_2/transition.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:now_news/src/reusable/methods/routes.dart';
import 'package:now_news/src/reusable/widgets/menu.dart';
import 'package:now_news/src/screens/categories-page.dart';
import 'package:now_news/src/screens/news-page.dart';
import 'package:now_news/src/screens/popular-page.dart';
import 'package:now_news/src/screens/storie-page.dart';

import '../responsive/responsive-method.dart';

late int responsiveId;
late double vw;
late double vh;
late double ratio;
late double vr;

class HomePage extends StatefulWidget {
  late BuildContext context;
  HomePage(this.context, {super.key}) {
    Map<String, dynamic> responsive =
        ResponsiveData(context: context).getAspectRatio();
    responsiveId = responsive['id'];
    vw = responsive['vw'];
    vh = responsive['vh'];
    ratio = responsive['ratio'];
    vr = vh / ratio;
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _back() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _back,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        floatingActionButton: Menu(context, page: 0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          children: [
            SizedBox(height: 5 * vr),
            header(context),
            SizedBox(height: 5 * vr),
            searchBar(context),
            SizedBox(height: 5 * vr),
            stories(context),
            SizedBox(height: 5 * vr),
            popular(context),
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5 * vw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 10 * vw,
                height: 10 * vr,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/img/profile.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 2 * vw),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 3 * vw,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.25 * vr),
                  Row(
                    children: [
                      Text(
                        'Paul ',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 3.1 * vw,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/emojis/hi.png',
                        scale: 6.5,
                      ),
                    ],
                  ),
                ],
              )
            ],
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
                Iconsax.notification,
                color: Theme.of(context).primaryColorDark,
                size: 4.5 * vw,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5 * vw),
      width: double.infinity,
      height: 10 * vw,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(2.5 * vw),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 10 * vr,
            child: TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 3 * vw,
                height: 0,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.fromLTRB(8.5 * vw, 0, 2.5 * vw, 1.75 * vr),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 3 * vw,
                  fontWeight: FontWeight.normal,
                  height: 0,
                  //backgroundColor: Colors.red,
                ),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Positioned(
            left: 2.5 * vw,
            child: Container(
              width: 3.5 * vw,
              height: 10 * vw,
              child: Icon(
                Iconsax.search_normal,
                color: Theme.of(context).primaryColor,
                size: 3.5 * vw,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget stories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5 * vw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hot news',
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: 4.5 * vw,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.5 * vr),
          Container(
            width: double.infinity,
            height: 12.5 * vw,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                String logo_path = 'assets/img/news-logos/';

                switch (index) {
                  case 1:
                    logo_path += 'nmas.png';
                    break;
                  case 2:
                    logo_path += 'cnn.png';
                    break;
                  case 3:
                    logo_path += 'nyt.png';
                    break;
                  case 4:
                    logo_path += 'bbc.png';
                    break;
                  case 5:
                    logo_path += 'cbs.png';
                    break;
                  case 6:
                    logo_path += 'time.png';
                    break;
                  default:
                    logo_path += 'bbc.png';
                    break;
                }

                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.only(right: 5 * vw),
                    width: 12.5 * vw,
                    height: 12.5 * vw,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.add,
                      color: Theme.of(context).primaryColorDark,
                      size: 6 * vw,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () => Routes(context).goTo(StoriePage(context)),
                    child: Container(
                      margin: EdgeInsets.only(right: 5 * vw),
                      padding: EdgeInsets.all(2.5 * vw),
                      width: 12.5 * vw,
                      height: 12.5 * vw,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(logo_path),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget popular(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * vw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Popular',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 4.5 * vw,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Routes(context).goTo(PopularPage(context)),
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: 3.1 * vw,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.5 * vr),
        Container(
          margin: EdgeInsets.only(left: 5 * vw),
          width: double.infinity,
          height: 90 * vr,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              String img_path = '';
              String title = '';
              String info = '';

              switch (index) {
                case 0:
                  img_path =
                      'https://static.clubs.nfl.com/image/private/t_editorial_landscape_12_desktop/49ers/zcsbijecvehidosjrkfl';
                  title =
                      "QB coach says 49ers' Trey Lance needed drastic adjustment to...";
                  info = 'Cody Benjamin    ∙    3h ago';
                  break;
                case 1:
                  img_path =
                      'https://s.yimg.com/ny/api/res/1.2/tJtuaE6PiRyEsR.hX7YIXw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtjZj13ZWJw/https://s.yimg.com/os/creatr-uploaded-images/2023-05/d1b94f60-f607-11ed-bfff-f5bbbc4746c9';
                  title =
                      "NBA playoffs: LeBron James struggles, tweaks injured foot...";
                  info = 'Vincent Goodwill    ∙    4h ago';
                  break;
                case 2:
                  img_path =
                      'https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D942/production/_129781655_gettyimages-1255682185.jpg';
                  title =
                      "Formula 1 to donate 1m euros to relief fund for Emilia-Romagna...";
                  info = 'Andrew Benson    ∙    4h ago';
                  break;
                default:
                  img_path = '';
                  title = "";
                  info = '    ∙    ';
                  break;
              }

              return GestureDetector(
                onTap: () => Routes(context)
                    .goTo(NewsPage(context, originPage: HomePage(context))),
                child: Container(
                  margin: EdgeInsets.only(right: 5 * vw),
                  width: 60 * vw,
                  height: 90 * vr,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60 * vw,
                        height: 70 * vr,
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
                                  color: Theme.of(context).primaryColor,
                                  size: 10 * vw),
                            );
                          },
                          enableRefresh: true,
                          image: AdvancedNetworkImage(
                            img_path,
                            timeoutDuration: const Duration(seconds: 10),
                            retryLimit: 2,
                            /*fallbackAssetImage:
                                                                      'assets/img/banner-cpb.png'*/
                          ),
                        ),
                      ),
                      SizedBox(height: 3 * vr),
                      Container(
                        height: 17 * vr,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontSize: 3.75 * vw,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
