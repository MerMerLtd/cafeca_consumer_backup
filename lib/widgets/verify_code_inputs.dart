import 'package:flutter/material.dart';
import 'package:vercoder_inputer/vercoder_inputer.dart';

class VerifyCodeInputs extends StatefulWidget implements InputerProtocol {
  @override
  _VerifyCodeInputsState createState() => _VerifyCodeInputsState();

  @override
  void didFinishedInputer(
      WGQVerCodeInputer inputer, BuildContext ctx, String verCode) {
    print("verCode is $verCode");

    //判断验证码是否正确
    bool correct = false; //(此处修改成你自己的判断逻辑)
    if (!correct) {
      inputer.reset();
    }
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
      size: Size(screenSize.width*0.8, 48.0),
      options: opt,
    );
    return verCodeInputer;
  }
}
