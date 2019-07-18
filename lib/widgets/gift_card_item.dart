import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../prodivers/gift_card.dart';
import '../screens/card_detail_screen.dart';

class GiftCardItem extends StatefulWidget {
  @override
  _GiftCardItemState createState() => _GiftCardItemState();
}

class _GiftCardItemState extends State<GiftCardItem> {
@override
  Widget build(BuildContext context) {
    final giftCard = Provider.of<GiftCard>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: GridTile(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.of(context).pushNamed(
              CardDetailScreen.routeName,
            );
          },
          child: Hero(
            child: Image.network(
              giftCard.imageUrl,
              fit: BoxFit.cover,
            ),
            tag: giftCard.id,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white54,
          title: Text(
            giftCard.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
