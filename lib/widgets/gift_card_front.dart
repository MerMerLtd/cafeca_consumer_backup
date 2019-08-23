import 'package:flutter/material.dart';

import '../providers/gift_card.dart';
// import 'package:flutter_blue/flutter_blue.dart';

class GiftCardFront extends StatelessWidget {
  const GiftCardFront({
    Key key,
    @required this.giftCard,
  }) : super(key: key);

  final GiftCard giftCard;

  @override
  Widget build(BuildContext context) {
    // FlutterBlue flutterBlue = FlutterBlue.instance;
    return GestureDetector(
      onDoubleTap: () {
      
        
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
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
      ),
    );
  }
}
