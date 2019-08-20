import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';


class OpenBleScreen extends StatelessWidget {
  final BluetoothState state;
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/bluetooth');
  const OpenBleScreen({Key key, this.state}) : super(key: key);
  Future<void> _openBlueTooth() async {
    
    await methodChannel.invokeMethod('openBlueTooth');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            // flex: 2,
            child: Center(
              child: Icon(
                Icons.bluetooth,
                size: 200.0,
                color: Colors.black26,
              ),
            ),
          ),
          Expanded(
            // flex: 1,
            child: Column(
              children: <Widget>[
                Text(
                  '開啟藍牙',
                  style: TextStyle(
                    color: Color(0xfffcfdfdf),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    '你需要開啟藍牙才可以使用 Cafeca',
                    style: TextStyle(
                      color: Color(0xfffcfdfdf),
                      // fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  width: double.infinity,
                  child: OutlineButton(
                    highlightedBorderColor: Color(0xfffcfdfdf),
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    textColor: Color(0xfffcfdfdf),
                    color: Colors.transparent,
                    borderSide: BorderSide(color: Color(0xfffcfdfdf)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      '允許開啟藍牙',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    onPressed:_openBlueTooth,
                  ),
                ),
                FlatButton(
                  textColor: Color(0xfffcfdfdf),
                  color: Colors.transparent,
                  child: Text(
                    '告訴我更多',
                    style: TextStyle(
                      // fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
