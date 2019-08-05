import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  String _tokenSecret;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(String phoneNo, String urlSegment) async {
    final url = 'https://api.cafeca.cc/api/v1/$urlSegment';
    try {
      final response = await http.post(
        url,
        headers: {
          // 'Content-Type': 'application/json',
          'Content-Type': 'application/json; charset=utf-8',
        },
        body: json.encode(
          {
            'mcc': '+886',
            'mobile': phoneNo,
          },
        ),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final responseData = json.decode(response.body);
      if (!responseData['success']) {
        switch (responseData['code']) {
          case '00000001':
            throw HttpException(responseData['message']);
          case '00000002':
            throw HttpException(responseData['message']);
          default:
            throw HttpException('Unexpected Error!');
        }
      }
      _userId = responseData['data']['UID'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['data']['next'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> register(
    String phoneNo,
  ) async {
    return _authenticate(phoneNo, 'register');
  }

  Future<void> login(phoneNo) async {
    return _authenticate(phoneNo, 'login');
  }

  Future<void> verify(String code) async {
    final url = 'https://api.cafeca.cc/api/v1/token/:$_userId/:$code';
    try {
      /// ====== After fix API uncomment this ================
      /// ====================================================
      // final response = await http.get(url);
      // final responseData = json.decode(response.body);
      // if (!responseData['success']) {
      //   switch (responseData['code']) {
      //     case '00000003':
      //       throw HttpException('Invalid Code');
      //     default:
      //       throw HttpException('Unexpected Error!');
      //   }
      // }
      // _token = responseData['data']['token'];
      // _tokenSecret = responseData['data']['tokenSecret'];
      /// ====================================================
      /// ====================================================

      /// ====== After fix API comment this ================
      /// ====================================================
      _token = 'bd5e5eb049f3907175f54f5a571ba6b9fdea36ab';
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: 1564828222214,
        ),
      );

      /// ====================================================
      /// ====================================================
      notifyListeners();
      print(isAuth);
    } catch (error) {
      throw error;
    }
  }
}
