import 'package:flutter/material.dart';

import '../providers/gift_card.dart';
import './spiral_button.dart';

class GiftCardBack extends StatelessWidget {
  const GiftCardBack({
    Key key,
    @required this.giftCard,
  }) : super(key: key);

  final GiftCard giftCard;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Image.network(
            giftCard.imageUrl,
            fit: BoxFit.cover,
            color: Color(0x77ffffff),
            colorBlendMode: BlendMode.screen,
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.white54,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    giftCard.title,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // 傳送卡片給好友
                    },
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.white54,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 10),
                child: Text(
                  giftCard.description,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Find service counters',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SpiralButton(
                    radius: 50.0,
                    buttonColor: Colors.white60,
                    onPressed: () {
                      print('on Pressed');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
