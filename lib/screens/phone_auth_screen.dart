import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/http_exception.dart';

import '../widgets/flat_appbar.dart';
import './sms_code_input_screen.dart';
// import './sms_code_sending_screen.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  const PhoneAuthScreen({Key key}) : super(key: key);

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _phoneInputController = TextEditingController();
  var _phoneIsEmpty = true;
  var _isLoading = false;
  Map<String, String> _authData = {'phoneNo': ''};
  void _whetherPhoneIsEmpty() {
    if (_phoneInputController.text.isEmpty) {
      setState(() {
        _phoneIsEmpty = true;
      });
    } else {
      setState(() {
        _phoneIsEmpty = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              _phoneInputController.text = '';
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      print(_authData['phoneNo']);
      await Provider.of<Auth>(context, listen: false).register(
        _authData['phoneNo'],
      );
      Navigator.push(
        context,
        // MaterialPageRoute(builder: (context) => SMSCodeSendingScreen()));
        MaterialPageRoute(
          builder: (context) =>
              SMSCodeInputScreen(phone: '+886 ' + _phoneInputController.text),
        ),
      );
    } on HttpException catch (error) {
      var errorMessage = error.message;
      _showErrorDialog(errorMessage);
    } catch (error) {
      // const errorMessage =
      //     'Could not send you verify code. Please try again later.';
      _showErrorDialog(error.toString());
    }
    ///// ========for testing ========
    ///===============================
    Navigator.push(
      context,
      // MaterialPageRoute(builder: (context) => SMSCodeSendingScreen()));
      MaterialPageRoute(
        builder: (context) =>
            SMSCodeInputScreen(phone: '+886 ' + _phoneInputController.text),
      ),
    );

    ///===============================
    ///===============================
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _phoneInputController.addListener(_whetherPhoneIsEmpty);
    super.initState();
  }

  @override
  void dispose() {
    _phoneInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FlatAppBar(
                title: Text(
                  '登入Cafeca',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '輸入手機號碼',
                              style: TextStyle(
                                  // fontSize: 20,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 40, left: 30, right: 30),
                            child: Row(
                              children: <Widget>[
                                FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  color: Colors.grey[200],
                                  onPressed: () {
                                    // https://flutter.dev/docs/cookbook/navigation/returning-data
                                    // Navigator.of(context).push(context, MaterialPageRoute(builder: (context) => CountryCodeScreen()) )
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '+886',
                                        style: TextStyle(
                                          // fontSize: 20,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Icon(
                                        Icons.expand_more,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    autofocus: true,
                                    controller: _phoneInputController,
                                    keyboardType: TextInputType.phone,
                                    // style: TextStyle(fontSize: 20),
                                    // validator: (value) {
                                    //   if (value.length < 9) {
                                    //     return 'phone number is too short!';
                                    //   }
                                    // },
                                    onSaved: (value) {
                                      _authData['phoneNo'] =
                                          value.startsWith('0')
                                              ? value
                                              : '0$value';
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    text:
                                        '點按下一步可收到 Facebook account kit 的簡訊確認。Cafeca 會使用 Facebook 技術來協助你登入，但是你不需要 Facebook 帳號。可能會收取訊息費用和資費。',
                                  ),
                                  TextSpan(
                                    text: '了解 Facebook 如何使用你的資料',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        launch(
                                            'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            width: double.infinity,
                            child: RaisedButton(
                              disabledColor: Colors.grey[200],
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '下一步',
                                // style: TextStyle(fontSize: 20),
                              ),
                              onPressed: !_phoneIsEmpty
                                  ? () {
                                      // sendHttpRequest
                                      _submit();
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
