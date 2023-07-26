import 'package:flutter/material.dart';
import 'package:rick_morty_app/presentation/views/episode_view.dart';
import 'package:rick_morty_app/presentation/views/home_view.dart';
import 'package:rick_morty_app/presentation/views/location_view.dart';
import 'package:rick_morty_app/presentation/widgets/shared/custom_navigaton_bar.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;
  final viewRoutes = const <Widget>[HomeView(), LocationScreen(), EpisodeScreen()];
  const HomeScreen({Key? key, required this.pageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children: viewRoutes,
        ),
        bottomNavigationBar: CustomNavigatonBar(
          currentIndex: pageIndex,
        ));
  }
}
