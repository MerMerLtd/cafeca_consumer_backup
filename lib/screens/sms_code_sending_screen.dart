import 'package:flutter/material.dart';

import '../widgets/flat_appbar.dart';
import '../widgets/sms_loading.dart';
import '../widgets/circle_progress.dart';

class SMSCodeSendingScreen extends StatefulWidget {
  @override
  _SMSCodeScreenState createState() => _SMSCodeScreenState();
}

class _SMSCodeScreenState extends State<SMSCodeSendingScreen> {
  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatAppBar(
              title: Text(
                '登入Cafeca',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            !_isLoading
                ? SMSLoading(
                    hintText: Text(
                      '透過簡訊傳送代碼',
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    ),
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                    ),
                  )
                : SMSLoading(
                    hintText: Text(
                      '已傳送 !',
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    ),
                    child: Container(),
                  ),
          ],
        ),
      ),
    );
  }
}
