import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

import './screens/cards_overview_screen.dart';
import './screens/card_detail_screen.dart';
import './prodivers/gift_cards.dart';

void main() => runApp(CafecaConsumer());

class CafecaConsumer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GiftCards(),
      child: MaterialApp(
        title: 'Cafeca',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.pinkAccent,
        ),
        home: CardsOverviewScreen(),
        routes: {
          CardDetailScreen.routeName: (ctx) => CardDetailScreen(),
        },
        // onGenerateRoute: (settings) {
        //   switch (settings.name) {
        //     case '/second':
        //       return PageTransition(
        //         child: CardDetailScreen(),
        //         type: PageTransitionType.scale,
        //       );
        //       break;
        //     default:
        //       return null;
        //   }
        // },
      ),
    );
  }
}
