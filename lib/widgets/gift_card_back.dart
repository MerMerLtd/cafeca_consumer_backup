import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gift_card.dart';

import '../widgets/app_bottom_sheet.dart';

class GiftCardBack extends StatelessWidget {
  const GiftCardBack({
    Key key,
    @required this.giftCard,
  }) : super(key: key);

  final GiftCard giftCard;

  @override
  Widget build(BuildContext context) {
    // var _inTheShop = false;
    // if (_inTheShop)
    //   Scaffold.of(context).showBottomSheet(
    //     (ctx) => AppBottomSheet(
    //           shopName: 'ShopName',
    //         ),
    //   );
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
            Container(
              height: _deviceData.size.height * 0.25,
              width: double.infinity,
              color: Colors.white54,
              child: FutureBuilder(
                future: giftCard.fetchAvailableShops(),
                builder: (ctx, snapshot) => snapshot.data == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount:
                            snapshot.data.length, // giftCard.availableShops[i]
                        itemBuilder: (ctx, i) => Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: Text(giftCard.availableShops[i]['name']),
                                onTap: () {
                                  print(giftCard.availableShops[i].toString());
                                  Scaffold.of(context).showBottomSheet(
                                    (ctx) => AppBottomSheet(
                                      shopName: giftCard.availableShops[i]['name'],
                                    ),
                                  );
                                },
                              ),
                              Text(giftCard.availableShops[i]['distance']
                                  .toString()),
                            ],
                          ),
                        ),
                      ),
              ),
              // child: Consumer<GiftCard>(
              //   builder: (ctx, gc, _) {
              //     print(gc.availableShops.toString());
              //     return Center(
              //       child: Text(gc.availableShops.toString()),
              //     );
              //   },
              // )
              //   builder: (ctx, giftCard, _) => giftCard != null
              //       ? ListView.builder(
              //           itemCount: giftCard.availableShops.length,
              //           itemBuilder: (ctx, i) => Row(
              //             children: <Widget>[
              //               InkWell(
              //                 child: Text(giftCard.availableShops[i]['name']),
              //                 onTap: () {
              //                   print(giftCard.availableShops[i].toString());
              //                 },
              //               ),
              //             ],
              //           ),
              //         )
              //       : CircularProgressIndicator(),
              // ),
            ),
          ],
        ),
      ],
      // ),
    );
  }
}

// Text(
//                             availableShopSnapshot.data.toString(),
//                             // giftCard.availableShops.toString(),
//                           ),
