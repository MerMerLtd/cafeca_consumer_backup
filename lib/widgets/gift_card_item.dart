// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

import 'package:flip_card/flip_card.dart';
import '../providers/gift_card.dart';
// import '../screens/card_detail_screen.dart';
// import '../widgets/scale_route.dart';
import '../widgets/swipe_detector.dart';
import '../widgets/gift_card_front.dart';
import '../widgets/gift_card_back.dart';

class GiftCardItem extends StatefulWidget {
  @override
  _GiftCardItemState createState() => _GiftCardItemState();
}

class _GiftCardItemState extends State<GiftCardItem> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    final giftCard = Provider.of<GiftCard>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);

    ///  ======= mark used ======
    /// giftCard.markUsedStatus(authData.token, authData.userId,);
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      direction: FlipDirection.HORIZONTAL,
      front: SwipeDetector(
        onSwipeLeft: () {
          cardKey.currentState.toggleCard();
          giftCard.fetchAvailableShops();
          print(giftCard.availableShops);
        },
        // onSwipeRight: () => cardKey.currentState.toggleCard(),
        child: GiftCardFront(giftCard: giftCard),
      ),
      back: SwipeDetector(
        // onSwipeLeft: () => cardKey.currentState.toggleCard(),
        onSwipeRight: () => cardKey.currentState.toggleCard(),
        child: Transform.scale(
          scale: 1,
          child: Transform.scale(
            scale: 1.43,
            child: GiftCardBack(giftCard: giftCard),
          ),
        ),
      ),
    );
  }
}

/// ====== After fix API use this version ==============
/// ====================================================

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/auth.dart';

// import 'package:flip_card/flip_card.dart';
// import '../providers/gift_card.dart';
// // import '../screens/card_detail_screen.dart';
// // import '../widgets/scale_route.dart';
// import '../widgets/swipe_detector.dart';
// import '../widgets/gift_card_front.dart';
// import '../widgets/gift_card_back.dart';

// class GiftCardItem extends StatefulWidget {
//   final GiftCard giftCard;
//   GiftCardItem(this.giftCard);
//   @override
//   _GiftCardItemState createState() => _GiftCardItemState();
// }

// class _GiftCardItemState extends State<GiftCardItem> {
//   GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

//   @override
//   Widget build(BuildContext context) {
//     final authData = Provider.of<Auth>(context, listen: false);

//     ///  ======= mark used ======
//     /// giftCard.markUsedStatus(authData.token, authData.userId,);
//     return FlipCard(
//       key: cardKey,
//       flipOnTouch: false,
//       direction: FlipDirection.HORIZONTAL,
//       front: SwipeDetector(
//         onSwipeLeft: () => cardKey.currentState.toggleCard(),
//         // onSwipeRight: () => cardKey.currentState.toggleCard(),
//         child: GiftCardFront(giftCard: widget.giftCard),
//       ),
//       back: SwipeDetector(
//         // onSwipeLeft: () => cardKey.currentState.toggleCard(),
//         onSwipeRight: () => cardKey.currentState.toggleCard(),
//         child: Transform.scale(
//           scale: 1,
//           child: Transform.scale(
//             scale: 1.43,
//             child: GiftCardBack(giftCard: widget.giftCard),
//           ),
//         ),
//       ),
//     );
//   }
// }
