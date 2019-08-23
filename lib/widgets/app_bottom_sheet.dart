import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final String shopName;
  const AppBottomSheet({this.shopName,});

  @override
  Widget build(BuildContext context) {
     final _deviceSize = MediaQuery.of(context).size;
    return BottomSheet(
          builder: (context) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                height: _deviceSize.height * 0.3,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text(
                        shopName,
                        style: TextStyle(
                          // fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      textColor:
                          Theme.of(context).primaryTextTheme.title.color,
                      padding: EdgeInsets.symmetric(
                          horizontal: 120, vertical: 16),
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
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Icon(Icons.expand_more),
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
