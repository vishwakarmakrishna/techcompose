import 'dart:async';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:techcompose/app/config/config.dart';
import 'package:techcompose/app/pages/movie_detailed_page.dart';
import 'package:techcompose/app/pages/widgets/background_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController? controller;

  late Timer timer;
  final List<Widget> imageData = List.generate(
      6,
      (index) => Assets.images.homeMainImage.image(
            fit: BoxFit.cover,
          ));
  @override
  void initState() {
    super.initState();
    controller = PageController();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      // Auto-animate to the next page every 3 seconds
      if ((controller?.page ?? 0) < imageData.length - 1) {
        controller?.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // If on the last page, jump back to the first page
        controller?.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    timer.cancel();
    super.dispose();
  }

  int activePageIndex = 0;
  void onPageChanged(int i) {
    if (!mounted) return;
    setState(() {
      activePageIndex = i;
    });
  }

  void navigateToMoviesPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MovieDetailedPage(),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double drawerWidth = screenWidth / 1.5;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: const Color(0xff0A071E),
        width: drawerWidth,
        child: SafeArea(
          child: SizedBox(
            width: drawerWidth,
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: InkResponse(
                    onTap: () {
                      _key.currentState?.closeDrawer();
                    },
                    child: Assets.images.close.image(),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                ...[
                  AppConst.series,
                  AppConst.peliculas,
                  AppConst.originales,
                  AppConst.recienAnadidos,
                  AppConst.ultimosDias,
                  AppConst.proximamente,
                ].map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 30),
                    child: Text(
                      e,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Divider(color: Colors.white54),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppConst.generos,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi,
                        child: Assets.images.back.image(),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white54),
                const SizedBox(
                  height: 35,
                ),
                Assets.images.generos.image(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading: InkResponse(
                onTap: () {
                  _key.currentState?.openDrawer();
                },
                child: Assets.images.menu.image()),
            automaticallyImplyLeading: false,
            expandedHeight: 540.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView.builder(
                    controller: controller,
                    itemCount: imageData.length,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, i) => imageData.elementAt(i),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 50,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Main Title
                          const Text(
                            AppConst.onHomeTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: Fonts.secularOne,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            AppConst.onHomeHeading,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: Fonts.secularOne,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 22),
                          const Text(
                            AppConst.onHomeSubHeading,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),

                          // random text
                          const Text(
                            AppConst.onHomeContent,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              imageData.length,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: CircleAvatar(
                                  maxRadius: 6,
                                  backgroundColor: index == (activePageIndex)
                                      ? Colors.white
                                      : Colors.white30,
                                ),
                              ),
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              Assets.images.search.image(
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 20,
              ),
              Assets.images.profile.image(
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 20),
              child: Text(
                'Mi lista',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: InkResponse(
                      onTap: navigateToMoviesPage,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Assets.images.portrait2.image(
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            AppConst.losMiserables,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 20, top: 20),
              child: Text(
                AppConst.soloEnMovie,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Assets.images.poster6.image(
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(
                    child: Text(
                      AppConst.bienvenidoAMovie,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      AppConst.bienvenidoAMovieSubTitle,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color(0xff892AEC).withOpacity(.3)),
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AppConst.bienvenidoAMovieBtn,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 20, top: 20),
              child: Text(
                AppConst.nuevosEstrenos,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Assets.images.landscape2.image(
                      width: 220,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 20, top: 20),
              child: Text(
                AppConst.peliculasTop,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Assets.images.poster2.image(
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(
                    child: Text(
                      AppConst.nuestroTop10,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      AppConst.bienvenidoAMovie,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      AppConst.bienvenidoAMovieSubTitle,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: (index.isEven
                                      ? Assets.images.poster4
                                      : Assets.images.poster1)
                                  .image(
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 0),
                                  child: Text("#${index + 1}"),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
        ],
      ),
    ).setbg(Assets.images.homeBackground.provider());
  }
}
