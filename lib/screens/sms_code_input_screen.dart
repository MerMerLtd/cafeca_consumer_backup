import 'package:flutter/material.dart';

import '../widgets/flat_appbar.dart';
import '../widgets/verify_code_inputs.dart';
import '../widgets/terms.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

import '../screens/cards_overview_screen.dart';

class SMSCodeInputScreen extends StatefulWidget {
  final String phone;
  const SMSCodeInputScreen({this.phone});

  @override
  _SMSCodeInputScreenState createState() => _SMSCodeInputScreenState();
}

class _SMSCodeInputScreenState extends State<SMSCodeInputScreen> {
  var _isCompleted = false;
  var _code;
  Future<void> _verrfyCode() async {
    print(_code);
    if (_code == null) {
      return;
    }
    try {
      await Provider.of<Auth>(context).verify(_code);
      //https://zhuanlan.zhihu.com/p/56289929
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/', (Route<dynamic> route) => false);
    } catch (error) {
      throw error;
    }
  }

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
                      widget.phone,
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
                  VerifyCodeInputs(
                    onCompleted: (String value) {
                      if (value.length < 6) {
                        setState(() {
                          _isCompleted = false;
                        });
                      } else {
                        setState(() {
                          _isCompleted = true;
                          _code = value;
                        });
                      }
                    },
                  ),
                  //======================================
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      disabledColor: Colors.grey[200],
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '繼續',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      onPressed: _isCompleted ? _verrfyCode : null,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
