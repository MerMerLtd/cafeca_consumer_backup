import 'package:flutter/material.dart';

import '../widgets/card_swiper.dart';

class CardsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: CardSwiper(),
    );
  }
}
