import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              style: TextStyle(color: Colors.grey),
              text: '點按繼續可接受 Facebook 的',
            ),
            TextSpan(
              text: '使用條款',
              style: TextStyle(
                  color: Colors.grey, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch('https://www.facebook.com/legal/terms');
                },
            ),
            TextSpan(
              style: TextStyle(color: Colors.grey),
              text: '、',
            ),
            TextSpan(
              text: '資料政策',
              style: TextStyle(
                  color: Colors.grey, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch('https://www.facebook.com/privacy/explanation');
                },
            ),
            TextSpan(
              style: TextStyle(color: Colors.grey),
              text: '、',
            ),
            TextSpan(
              text: 'Cookie 的使用',
              style: TextStyle(
                  color: Colors.grey, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch('https://www.facebook.com/policies/cookies/');
                },
            ),
            TextSpan(
              style: TextStyle(color: Colors.grey),
              text: '，Cafeca 的',
            ),
            TextSpan(
              text: '隱私政策',
              style: TextStyle(
                  color: Colors.grey, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch('https://www.facebook.com/privacy/explanation');
                },
            ),
            TextSpan(
              style: TextStyle(color: Colors.grey),
              text: '與',
            ),
            TextSpan(
              text: '服務條款',
              style: TextStyle(
                  color: Colors.grey, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch('https://www.facebook.com/legal/terms');
                },
            ),
            TextSpan(
              style: TextStyle(color: Colors.grey),
              text: '。',
            ),
          ],
        ),
      ),
    );
  }
}
