import 'package:flutter/material.dart';

import '../prodivers/gift_card.dart';

class GiftCardFront extends StatelessWidget {
  const GiftCardFront({
    Key key,
    @required this.giftCard,
  }) : super(key: key);

  final GiftCard giftCard;

  @override
  Widget build(BuildContext context) {
    return
     ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: Image.network(
          giftCard.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: Transform.scale(
          scale: 1,
          child: GridTileBar(
            backgroundColor: Colors.white54,
            title: Text(
              giftCard.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
