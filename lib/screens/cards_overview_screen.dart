import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../widgets/card_swiper.dart';
import '../widgets/app_drawer.dart';
import '../screens/open_ble_screen.dart';

class CardsOverviewScreen extends StatelessWidget {
  static const routeName = '/cards';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          final state = snapshot.data;
          if (state == BluetoothState.on) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Cards'),
              ),
              drawer: AppDrawer(),
              body: CardSwiper(),
            );
          }
          return OpenBleScreen(state: state);
        });
  }
}
