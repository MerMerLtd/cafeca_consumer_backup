import 'package:flutter/material.dart';
import 'package:vercoder_inputer/vercoder_inputer.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class VerifyCodeInputs extends StatefulWidget implements InputerProtocol {
  @override
  _VerifyCodeInputsState createState() => _VerifyCodeInputsState();

  @override
  void didFinishedInputer(
      WGQVerCodeInputer inputer, BuildContext ctx, String verCode) {
    print("verCode is $verCode");
    // sendHttpRequest
  }

  
}

class _VerifyCodeInputsState extends State<VerifyCodeInputs> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    //自定义外观样式(可选)
    Options opt = Options();
    opt.fontSize = 22.0;
    opt.fontColor = Theme.of(context).primaryColor;
    opt.fontWeight = FontWeight.w700;
    opt.emptyUnderLineColor = Colors.grey[300];
    opt.inputedUnderLineColor = Colors.grey[600];
    opt.focusedColor = Theme.of(context).accentColor;
    //创建控件,并指明代理对象(delegate)
    WGQVerCodeInputer verCodeInputer = WGQVerCodeInputer(
      codeLength: 6,
      size: Size(screenSize.width * 0.8, 48.0),
      options: opt,
      delegate: this.widget,
    );
    return Column(
      children: <Widget>[
        verCodeInputer,
        // SizedBox(
        //   height: 20,
        // ),
        // Container(
        //   width: double.infinity,
        //   child: RaisedButton(
        //     color: Theme.of(context).primaryColor,
        //     textColor: Colors.white,
        //     disabledColor: Colors.grey[200],
        //     elevation: 0,
        //     padding: EdgeInsets.symmetric(vertical: 15),
        //     child: Text(
        //       '繼續',
        //       style: TextStyle(
        //         fontSize: 20,
        //         letterSpacing: 2,
        //       ),
        //     ),
        //     onPressed: null,
        //   ),
        // ),
      ],
    );
  }
}
