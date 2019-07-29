import 'package:flutter/material.dart';
import '../providers/gift_cards.dart';
import 'package:provider/provider.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../widgets/gift_card_back.dart';
import '../widgets/app_bottom_sheet.dart';

class CardDetailScreen extends StatelessWidget {
  static const routeName = '/gift-card-detail';

  //
  final String id;

  const CardDetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context).settings.arguments as String;
    final loadedGiftCard = Provider.of<GiftCards>(context).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
      ),
      body: GiftCardBack(giftCard: loadedGiftCard),
      bottomSheet: AppBottomSheet(
        shopName: loadedGiftCard.title,
      ),
    );
  }
}
