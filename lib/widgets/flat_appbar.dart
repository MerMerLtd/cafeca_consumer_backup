import 'package:flutter/material.dart';

class FlatAppBar extends StatelessWidget {
  final Text title;

  const FlatAppBar({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Text(
                  '返回',
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.all(15),
            // color: Colors.pinkAccent,
            padding: Theme.of(context).buttonTheme.padding,
            child: title,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
