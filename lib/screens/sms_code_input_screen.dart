import 'package:flutter/material.dart';

import '../widgets/flat_appbar.dart';

class SMSCodeInputScreen extends StatelessWidget {
  final String phone;

  const SMSCodeInputScreen({this.phone});

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
            Container(
              child: Text(
                '輸入驗證碼',
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                phone,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                // TextFormField(),
                // TextFormField(),
                // TextFormField(),
                // TextFormField(),
                // TextFormField(),
                // TextFormField(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
