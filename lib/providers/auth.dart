import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  String _phoneNo;

  String get getPhoneNo {
    return _phoneNo;
  }

  Future<void> getVerifyCode(String phoneNo) async {
    print(phoneNo);
    _phoneNo = phoneNo;
    const url = '';
    final resposne = await http.post(
      url,
      body: json.encode(
        {
          'phoneNo': phoneNo,
          'returnSecureToken': true, // mimic what firebase do
        },
      ),
    );
  }

  Future<void> signUp(String phoneNo, String verifyCode) async {
    const url = '';
    final resposne = await http.post(
      url,
      body: json.encode(
        {
          'phoneNo': phoneNo,
          'verifyCode': verifyCode,
          'returnSecureToken': true, // mimic what firebase do
        },
      ),
    );
  }
}
