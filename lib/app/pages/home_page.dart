import 'package:flutter/material.dart';
import 'package:techcompose/app/config/config.dart';
import 'package:techcompose/app/pages/widgets/background_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading: Assets.images.menu.image(),
            automaticallyImplyLeading: false,
            expandedHeight: 540.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Assets.images.homeMainImage.image(
                fit: BoxFit.cover,
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
                          'Los miserables',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                'Solo en Movie+',
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
                    child: Assets.images.poster2.image(
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverFillRemaining(
            child: Column(),
          ),
        ],
      ),
    ).setbg(Assets.images.homeBackground.provider());
  }
}
