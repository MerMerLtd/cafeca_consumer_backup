import 'package:flutter/material.dart';

import '../widgets/flat_appbar.dart';
import '../widgets/verify_code_inputs.dart';
import '../widgets/terms.dart';

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
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
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
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //========== validation code ===========
                  VerifyCodeInputs(),
                  //======================================
                  SizedBox(
                    height: 20,
                  ),

                  // Container(
                  //   width: double.infinity,
                  //   child: RaisedButton(
                  //     elevation: 0,
                  //     padding: EdgeInsets.symmetric(vertical: 15),
                  //     child: Text(
                  //       '繼續',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //     onPressed: () {},
                  //   ),
                  // ),
                 
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '我沒有收到代碼',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Terms(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
