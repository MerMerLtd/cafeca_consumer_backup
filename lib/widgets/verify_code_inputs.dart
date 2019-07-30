import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/cards_overview_screen.dart';

class VerifyCodeInputs extends StatefulWidget {
  @override
  _ValidationCodeInputState createState() => _ValidationCodeInputState();
}

class _ValidationCodeInputState extends State<VerifyCodeInputs> {
  final _form = GlobalKey<FormState>();
  final List<TextEditingController> _tc = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<FocusNode> _fn = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _tc.asMap().forEach((index, tc) => tc.addListener(() {
          _changeFocus(index, tc);
          if (_checkIfComplete()) {
            setState(() {
              _isCompleted = true;
            });
          } else {
            setState(() {
              _isCompleted = false;
            });
          }
        }));
    _fn.asMap().forEach((index, fn) => fn.addListener(() {
          //
        }));
    super.initState();
  }

  @override
  void dispose() {
    _tc.forEach((tc) => tc.dispose());
    _fn.forEach((fn) => fn.dispose());
    super.dispose();
  }

  void _changeFocus(int index, TextEditingController tc) {
    // index range: 0~5
    // String text = tc.text;
    // tc.selection = TextSelection(baseOffset: text.length, extentOffset: text.length);
    if (tc.text.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_fn[index + 1]);
    }
    // if (tc.text.isEmpty && index > 0) {
    //   FocusScope.of(context).requestFocus(_fn[index - 1]);
    // }
  }

  bool _checkIfComplete() {
    if (_tc[0].text.isNotEmpty &&
        _tc[1].text.isNotEmpty &&
        _tc[2].text.isNotEmpty &&
        _tc[3].text.isNotEmpty &&
        _tc[4].text.isNotEmpty &&
        _tc[5].text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  var _isCompleted = false;
  List verifyCodeArray;
  int verifyCode;

  void _saveForm() {
    verifyCodeArray = [0, 0, 0, 0, 0, 0];
    _form.currentState.save();
    verifyCode = int.parse(verifyCodeArray.reduce((i, j) => i + j));
  }

  var _isLoading = false;

  // 可能可以用validator來 change focus

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _tc[0],
                  focusNode: _fn[0],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_fn[1]);
                  },
                  onSaved: (value) {
                    verifyCodeArray[0] = value;
                    // verifyCodeArray.insert(0, value);
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _tc[1],
                  focusNode: _fn[1],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_fn[2]);
                  },
                  onSaved: (value) {
                    verifyCodeArray[1] = value;
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _tc[2],
                  focusNode: _fn[2],
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_fn[3]);
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    verifyCodeArray[2] = value;
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _tc[3],
                  focusNode: _fn[3],
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_fn[4]);
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    verifyCodeArray[3] = value;
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _tc[4],
                  focusNode: _fn[4],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_fn[5]);
                  },
                  onSaved: (value) {
                    verifyCodeArray[4] = value;
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  controller: _tc[5],
                  focusNode: _fn[5],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    verifyCodeArray[5] = value;
                  },
                  onFieldSubmitted: (_) => _saveForm(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              disabledColor: Colors.grey[200],
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                '繼續',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
              onPressed: !_isCompleted
                  ? null
                  : () {
                      _saveForm();
                      print(verifyCode);
                      Navigator.of(context).pushNamed(CardsOverviewScreen.routeName);
                    },
            ),
          ),
        ],
      ),
    );
  }
}

// final List _tfTools = [
//     {'tc': TextEditingController(), 'fn': FocusNode()},
//     {'tc': TextEditingController(), 'fn': FocusNode()},
//     {'tc': TextEditingController(), 'fn': FocusNode()},
//     {'tc': TextEditingController(), 'fn': FocusNode()},
//     {'tc': TextEditingController(), 'fn': FocusNode()},
//     {'tc': TextEditingController(), 'fn': FocusNode()},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var i = 0;
//     return Form(
//       key: _form,
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               ..._tfTools.map((tool) {
//                 i++;
//                 return Expanded(
//                   flex: 1,
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         flex: 1,
//                         child: TextFormField(
//                           keyboardType: TextInputType.number,
//                           textAlign: TextAlign.center,
//                           controller: tool['tc'],
//                           focusNode: tool['fn'],
//                         ),
//                       ),
//                       if(i < 6)
//                       SizedBox(
//                         width: 20,
//                       ),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ],
//           ),
//           SizedBox(height: 20),
//           Container(
//             width: double.infinity,
//             child: RaisedButton(
//               disabledColor: Colors.grey[200],
//               elevation: 0,
//               padding: EdgeInsets.symmetric(vertical: 15),
//               child: Text(
//                 '繼續',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.grey,
//                 ),
//               ),
//               onPressed: (){},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
