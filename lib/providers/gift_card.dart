import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GiftCard with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final List availableShopsId;
  bool isUsed;

  GiftCard({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    @required this.availableShopsId,
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
}
