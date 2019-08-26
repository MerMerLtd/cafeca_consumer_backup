import 'package:flutter/material.dart';
import 'dart:math';

import '../providers/gift_card.dart';
import '../widgets/stamp.dart';
// import 'package:flutter_blue/flutter_blue.dart';

class GiftCardFront extends StatelessWidget {
  const GiftCardFront({
    Key key,
    @required this.giftCard,
  }) : super(key: key);

  final GiftCard giftCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        // 把卡片送人
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            GridTile(
              child: Image.network(
                giftCard.imageUrl,
                fit: BoxFit.cover,
              ),
              footer: Transform.scale(
                scale: 1.5,
                child: GridTileBar(
                  backgroundColor: Colors.white70,
                  title: Text(
                    giftCard.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            if (giftCard.isUsed)
              Container(
                color: Colors.black38,
                child: Transform.scale(
                alignment: Alignment.topLeft,
                scale: 1.3,
                child: Transform.translate(
                  offset: Offset(-10, -10),
                  child: Stamp(
                    shopName: 'xxxx',
                    date: '2019-08-26',
                    position: Alignment.topLeft,
                    angle: -pi / 12,
                  ),
                ),
              ),),//這需要跟backend拿
          ],
        ),
      ),
    );
  }
}
