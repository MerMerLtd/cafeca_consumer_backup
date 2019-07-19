import 'package:flutter/material.dart';

import '../prodivers/gift_card.dart';

class GiftCardBack extends StatelessWidget {
  const GiftCardBack({
    Key key,
    @required this.giftCard,
  }) : super(key: key);

  final GiftCard giftCard;

  @override
  Widget build(BuildContext context) {
    var _deviceData = MediaQuery.of(context);
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
              // margin: EdgeInsets.all(10),
              color: Colors.white54,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  giftCard.title,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.white54,
              // margin: EdgeInsets.all(10),
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
            ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: _deviceData.size.height) * 0.25,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white54),
                    ),
                    ListView.builder(
                      itemBuilder: (BuildContext context, int index) {},
                    )
                  ],
                )),
          ],
        ),
      ],
      // ),
    );
  }
}
