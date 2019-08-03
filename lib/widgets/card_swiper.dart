import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../providers/gift_cards.dart';
import './gift_card_item.dart';

// to fix gesture conflict
// https://flutter.dev/docs/development/ui/advanced/gestures#gesture-disambiguation
// https://www.davidanaya.io/flutter/combine-multiple-gestures.html

class CardSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final giftCardsData = Provider.of<GiftCards>(context);
    final giftCards = giftCardsData.items;
    return Swiper(
      itemCount: giftCards.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: giftCards[i],
            child: Transform.scale(
              child: GiftCardItem(),
              scale: 0.7,
            ),
          ),
      itemWidth: _size.width, //* 0.7,
      itemHeight: _size.height * 0.88, // * 0.55,
      layout: SwiperLayout.TINDER,
      scrollDirection: Axis.vertical,
    );
  }
}
