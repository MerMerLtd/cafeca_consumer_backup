import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GiftCard with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  List availableShops = [];
  bool isUsed;

  GiftCard({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    // this.availableShops,
    this.isUsed = false,
  });

  void _markUsed(bool newValue) {
    isUsed = newValue;
    notifyListeners();
  }

  Future<void> markUsedStatus(String token, String userId) async {
    isUsed = true;
    notifyListeners();
    final url = '??/$userId/$id?auth=$token';
    try {
      final response = await http.put(
        url,
        body: json.encode(isUsed),
      );
      if (response.statusCode >= 400) {
        _markUsed(false);
      }
    } catch (error) {
      _markUsed(false);
    }
  }

  Future<List> fetchAvailableShops(
   [ String token,
    String userId,]
  ) async {
    // final url = '??/$userId/$id?auth=$token';
    try {
    //   final response = await http.get(url);
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //   if (extractedData == null) {
    //     return;
    //   }
    //   availableShops = extractedData.entries.toList();
     return availableShops = [
        {
          'id': 'shop1',
          'name': 'Cama Cafe',
          'distance': 12030.0,
        },
        {
          'id': 'shop2',
          'name': 'OKLao Coffee',
          'distance': 120.0,
        },
        {
          'id': 'shop3',
          'name': 'Lousia',
          'distance': 30.0,
        },
        {
          'id': 'shop4',
          'name': '7-11',
          'distance': 120300.0,
        },
         {
          'id': 'shop5',
          'name': 'Cama Cafe',
          'distance': 12030.0,
        },
        {
          'id': 'shop6',
          'name': 'OKLao Coffee',
          'distance': 120.0,
        },
        {
          'id': 'shop7',
          'name': 'Lousia',
          'distance': 30.0,
        },
      ];
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }
}
