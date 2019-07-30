import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    if (tc.text.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_fn[index + 1]);
    }
    // if (tc.text.isEmpty && index > 0) {
    //   FocusScope.of(context).requestFocus(_fn[index - 1]);
    // }
  }

  var _isCompleted = false;
  List verifyCodeArray;
  int verifyCode;

  void _saveForm() {
    verifyCodeArray = [0, 0, 0, 0, 0, 0];
    _form.currentState.save();
    verifyCode = int.parse(verifyCodeArray.reduce((i, j) => i + j));
  }

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
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
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
              disabledColor: Colors.grey[200],
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                '繼續',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              onPressed: !_isCompleted
                  ? null
                  : () {
                      // print(verifyCodeArray);
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
