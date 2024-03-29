import 'package:flutter/material.dart';
import 'dart:math';

class Stamp extends StatelessWidget {
  final String shopName;
  final String date;
  final double angle;
  final AlignmentGeometry position;
  final Color color;

  const Stamp({
    Key key,
    @required this.shopName,
    @required this.date,
    this.angle,
    this.position,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: position != null ? position : Alignment.bottomRight,
      child: Transform.rotate(
        angle: angle != null ? angle : pi / 12.0,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'USED',
                  style: TextStyle(color: color != null ? color: Colors.white),
                ),
                Text(
                  'in $shopName',
                  style: TextStyle(fontSize: 10, color: color != null ? color: Colors.white70),
                ),
                Text(
                  '$date',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: color != null ? color: Colors.white),
                ),
              ],
            ),
          ),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color != null ? color: Colors.white60,
              width: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
