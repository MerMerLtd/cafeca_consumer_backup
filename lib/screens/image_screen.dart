import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import './phone_auth_screen.dart';

class ImageScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // ===== uniform Color background =====
              // color: Color(0xff112233),
              // =====================================
              // ===== Image Background =====
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage(
              //       'https://images.unsplash.com/photo-1520646924857-261be3037bc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'),
              // ),
              // =====================================
              // ===== Gradient Color background =====
              //https://www.eggradients.com/category/black-and-blue-gradient?cf9e2668_page=2
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  Colors.red,
                ],
              ),
              // =====================================
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          AssetImage('assets/images/Logo_copy.png'),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        '建立新帳號',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      width: double.infinity,
                      child: OutlineButton(
                        highlightedBorderColor: Color(0xffffffff),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        textColor: Color(0xffffffff),
                        color: Colors.transparent,
                        borderSide: BorderSide(color: Color(0xffffffff)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          '以電話號碼登入',
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => PhoneAuthScreen()),
                          // );
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.downToUp,
                              child: PhoneAuthScreen(),
                            ),
                          );
                          // Navigator.of(context).pushNamed(PhoneAuthScreen.routeName);
                        },
                      ),
                    ),
                    FlatButton(
                      textColor: Color(0xffffffff),
                      color: Colors.transparent,
                      child: Text(
                        '登入時遇到問題嗎？',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
