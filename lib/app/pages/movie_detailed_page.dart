import 'package:flutter/material.dart';
import 'package:techcompose/app/config/config.dart';
import 'package:techcompose/app/pages/widgets/background_image.dart';

class MovieDetailedPage extends StatefulWidget {
  const MovieDetailedPage({super.key});

  @override
  State<MovieDetailedPage> createState() => _MovieDetailedPageState();
}

class _MovieDetailedPageState extends State<MovieDetailedPage> {
  void onBackPress() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading: InkResponse(
              onTap: onBackPress,
              child: Assets.images.back.image(),
            ),
            automaticallyImplyLeading: false,
            expandedHeight: 483.0,
            flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppConst.losMiserables,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: Fonts.secularOne,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        AppConst.movieDuration,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                      const Text(
                        AppConst.movieRating,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                      const Text(
                        AppConst.movieYear,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                      const Text(
                        AppConst.movieQuality,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ]
                        .map((e) => Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: e))
                        .toList(),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Assets.images.play.image(),
                      const Spacer(),
                      Assets.images.plus.image(),
                      Assets.images.download.image(),
                    ],
                  ),
                ],
              ),
            )) // gradient layer
                .mainLinearGrad()
                // main bg layer
                .setbg(
                  Assets.images.portrait2.provider(),
                  // fit: BoxFit.contain,
                ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                AppConst.movieContent,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                AppConst.movieContent2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 20, top: 20),
              child: Text(
                AppConst.extras,
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
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 220,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.images.landscape.image(
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "${AppConst.losMiserables}: ${AppConst.extras}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: Fonts.secularOne,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      AppConst.movieDuration2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Assets.images.download.image(),
                            ],
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
                AppConst.masContenidoSimilar,
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
        ],
      ),
    ).setbg(Assets.images.homeBackground.provider());
  }
}
