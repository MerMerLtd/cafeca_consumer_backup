import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class GiftCard with ChangeNotifier {
  String name;
  String imageUrl;
  String from;
  String stamp;
  bool isUsed;
  String id;
  String title;
  String description;
  double price;
  List serviceCounters = [];

  GiftCard({
    this.name,
    this.imageUrl,
    this.from,
    this.stamp,
    this.isUsed = false,
    this.id,
    this.title,
    this.description,
    this.price,
    this.serviceCounters,
  });
  void _markUsed(bool newValue) {
    isUsed = newValue;
    notifyListeners();
  }

  Future<void> markUsedStatus(String token) async {
    isUsed = true;
    notifyListeners();
    final url = 'https://api.cafeca.cc/api/v1/user/card/$id';
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Token': token,
        },
        body: json.encode(isUsed),
      );
      if (response.statusCode >= 400) {
        _markUsed(false);
      }
    } catch (error) {
      _markUsed(false);
    }
  }

// readCard
// Get the information of a card
  Future<void> readCard(String token) async {
    final url = 'https://api.cafeca.cc/api/v1/user/card/$id';
    try {
      final response = await http.get(
        url,
        headers: {
          // 'Content-Type': 'application/json',
          'Token': token,
        },
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['success'] == false) {
        // error handling...
        return;
      }
      if (extractedData['success'] == true) {
        return;
      }
    } catch (error) {
      // error handling...
    }
  }

// Give Card
// Get the information of a card
  Future<void> giveCard(String token) async {
    final url = 'https://api.cafeca.cc/api/v1/user/card/$id/give';
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Token': token,
        },
        body: json.encode({}),
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['success'] == false) {
        // error handling...
        return;
      }
      if (extractedData['success'] == true) {
        return;
      }
    } catch (error) {
      // error handling...
    }
  }
// Find Nearby Users
// find those users who are close to you
  Future<void> findNearbyUsers(String token) async {
    // get user's location
    // how to fetch user's location // use google
    double lat = 40.714224;
    double lng = -73.961452;
    final url = 'https://api.cafeca.cc/api/v1/user?latlng=$lat,$lng';
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Token': token,
        },
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['success'] == false) {
        // error handling...
        return;
      }
      if (extractedData['success'] == true) {
        return;
      }
    } catch (error) {
      // error handling...
    }
  }
// Find Service Counter
// Get the information of a card
  Future<void> findServiceCounters([String token]) async {
    // final url = 'https://api.cafeca.cc/api/v1/user/card/$id/servicecounters';
    try {
      // final response = await http.get(
      //   url,
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Token': token,
      //   },
      // );
      // final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // if (extractedData['success'] == false) {
      //   // error handling...
      //   return;
      // }
      // if (extractedData['success'] == true) {
      //   return;
      // }
      return serviceCounters = [
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
      // error handling...
    }
    notifyListeners();
  }
}
