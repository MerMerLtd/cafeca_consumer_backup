import 'package:flutter/material.dart';
import '../prodivers/gift_cards.dart';
import 'package:provider/provider.dart';

import '../widgets/gift_card_back.dart';

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
    );
  }
}
