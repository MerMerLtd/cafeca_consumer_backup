import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final String shopName;
  final Function onPressed;
  const AppBottomSheet({this.shopName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return BottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      builder: (context) => Container(
        height: _deviceSize.height * 0.33,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                shopName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton(
              color: Colors.white24, //Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryTextTheme.title.color,
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              shape: StadiumBorder(),
              //https://blog.csdn.net/yuzhiqiang_1993/article/details/85004313
              // BeveledRectangleBorder 带斜角的长方形边框
              // CircleBorder 圆形边框
              // RoundedRectangleBorder 圆角矩形
              // StadiumBorder 两端是半圆的边框
              child: Text(
                '兌換',
                style: TextStyle(
                    // fontSize: 16,
                    ),
              ),
              onPressed: onPressed,
            ),
            FlatButton(
              child: Icon(
                Icons.expand_more,
                color: Colors.white,
              ),
              shape: CircleBorder(side: BorderSide.none),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      onClosing: () {},
    );
  }
}
