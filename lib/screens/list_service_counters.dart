import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/gift_card.dart';
import '../widgets/app_bottom_sheet.dart';

class ListServiceCounters extends StatelessWidget {
  // static const routeName = '/service-counters';
  @override
  Widget build(BuildContext context) {
    final giftCard = Provider.of<GiftCard>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Counters'),
      ),
      body: FutureBuilder(
        future: giftCard.findServiceCounters(),
        builder: (ctx, snapshot) => snapshot.data == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data.length, // giftCard.availableShops[i]
                itemBuilder: (ctx, i) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Text(giftCard.serviceCounters[i]['name']),
                        onTap: () {
                          Scaffold.of(context).showBottomSheet(
                            (ctx) => AppBottomSheet(
                              shopName: giftCard.serviceCounters[i]['name'],
                            ),
                          );
                        },
                      ),
                      Text(giftCard.serviceCounters[i]['distance'].toString()),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
