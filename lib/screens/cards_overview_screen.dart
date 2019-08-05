import 'package:flutter/material.dart';

import '../widgets/card_swiper.dart';
import '../widgets/app_drawer.dart';

class CardsOverviewScreen extends StatelessWidget {
  static const routeName = '/cards';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      drawer: AppDrawer(),
      body: CardSwiper(),
    );
  }
}
