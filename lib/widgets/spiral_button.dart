import 'package:flutter/material.dart';

class SpiralButton extends StatelessWidget {
  final Function onPressed;
  final Color buttonColor;
  final double radius;

  SpiralButton({this.buttonColor, this.onPressed, this.radius});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: buttonColor, width: radius * 0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: buttonColor, width: radius * 0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipOval(
                  child: Material(
                    color: buttonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
