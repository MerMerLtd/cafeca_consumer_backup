import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:page_transition/page_transition.dart';

import './screens/image_screen.dart';
import './screens/cards_overview_screen.dart';
import './screens/card_detail_screen.dart';
import './screens/phone_auth_screen.dart';
import './providers/auth.dart';
import './providers/gift_cards.dart';
import './screens/splash_screen.dart';

void main() => runApp(CafecaConsumer());

class CafecaConsumer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <SingleChildCloneableWidget>[
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProvider.value(
            value: GiftCards(),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, child) => MaterialApp(
            title: 'Cafeca',
            theme: ThemeData(
              primarySwatch: Colors.pink,
              accentColor: Colors.pinkAccent,
            ),
            home: auth.isAuth
                ? CardsOverviewScreen()
                : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : ImageScreen(),
                    ), //CardsOverviewScreen(),
            routes: {
              ImageScreen.routeName: (ctx) => ImageScreen(),
              CardDetailScreen.routeName: (ctx) => CardDetailScreen(),
              PhoneAuthScreen.routeName: (ctx) => PhoneAuthScreen(),
              CardsOverviewScreen.routeName: (ctx) => CardsOverviewScreen(),
            },
          ),
        ));
  }
}

/// ====== After fix API use this version  also need to change GiftCardItem ==============
/// ======================================================================================

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'package:page_transition/page_transition.dart';

// import './screens/image_screen.dart';
// import './screens/cards_overview_screen.dart';
// import './screens/card_detail_screen.dart';
// import './screens/phone_auth_screen.dart';
// import './providers/auth.dart';
// import './providers/gift_cards.dart';

// void main() => runApp(CafecaConsumer());

// class CafecaConsumer extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: <SingleChildCloneableWidget>[
//           ChangeNotifierProvider.value(
//             value: Auth(),
//           ),
//           ChangeNotifierProxyProvider<Auth, GiftCards>(
//             builder: (ctx, auth, previousProducts) => GiftCards(
//                 auth.token,
//                 auth.userId,
//                 previousProducts == null ? [] : previousProducts.items),
//           ),
//         ],
//         child: Consumer<Auth>(
//           builder: (ctx, auth, child) => MaterialApp(
//             title: 'Cafeca',
//             theme: ThemeData(
//               primarySwatch: Colors.pink,
//               accentColor: Colors.pinkAccent,
//             ),
//             home: auth.isAuth
//                 ? CardsOverviewScreen()
//                 : ImageScreen(), //CardsOverviewScreen(),
//             routes: {
//               ImageScreen.routeName: (ctx) => ImageScreen(),
//               CardDetailScreen.routeName: (ctx) => CardDetailScreen(),
//               PhoneAuthScreen.routeName: (ctx) => PhoneAuthScreen(),
//               CardsOverviewScreen.routeName: (ctx) => CardsOverviewScreen(),
//             },
//           ),
//         ));
//   }
// }
