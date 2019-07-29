import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SMSLoading extends StatelessWidget {
  final Widget child;
  final Text hintText;

  const SMSLoading({
    @required this.hintText,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: hintText,
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: child,
          ),
        ),
      ],
    );
  }
}
