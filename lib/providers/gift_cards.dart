import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import './gift_card.dart';

class GiftCards with ChangeNotifier {
  List<GiftCard> _items = [
    GiftCard(
      id: 'i0',
      title: 'Paleo Pancakes',
      description:
          'Paleo Pancakes with Raspberries & Almond Butter. Low carbs, high protein paleo pancakes which is a good chioce for breakfast or snack after exercise',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1547043184-599cd7e6acb9?ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80',
    ),
    GiftCard(
      id: 'i1',
      title: 'Paleo Pancakes',
      description:
          'Paleo Pancakes with Raspberries & Almond Butter. Low carbs, high protein paleo pancakes which is a good chioce for breakfast or snack after exercise',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1501199846642-3181f389551d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    ),
    GiftCard(
      id: 'i2',
      title: 'Strawberry sandwich scones',
      description:
          'There’s a pop of zest in the scone dough for brightness, and each bite has some texture from the sugared top, a bright burst of berry, and an undertone of tropical, tart passionfruit.',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1558234469-50fc184d1cc9?ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80',
    ),
    GiftCard(
      id: 'i3',
      title: 'Blue berry muffin',
      description:
          'Bursting with fresh blueberries with a tender crumb and sparkling sugar crust, these really are the best blueberry muffins.',
      price: 13.99,
      imageUrl:
          'https://images.unsplash.com/photo-1560156710-0580247f9f69?ixlib=rb-1.2.1&auto=format&fit=crop&w=933&q=80',
    ),
    GiftCard(
      id: 'i4',
      title: 'Fruity Pizza',
      description:
          'Peanut Butter & Jelly Pizza with fresh berries, We love the fresh-roasted peanut taste, which pairs deliciously with jelly. Gotta love jelly pizza!',
      price: 16.99,
      imageUrl:
          'https://images.unsplash.com/photo-1553097736-d7382ec6c441?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=922&q=80',
    ),
    GiftCard(
      id: 'i5',
      title: 'Fruity Pizza',
      description:
          'Peanut Butter & Jelly Pizza with fresh berries, We love the fresh-roasted peanut taste, which pairs deliciously with jelly. Gotta love jelly pizza!',
      price: 16.99,
      imageUrl:
          'https://images.unsplash.com/photo-1553349450-fc075b13898c?ixlib=rb-1.2.1&auto=format&fit=crop&w=933&q=80',
    ),
    GiftCard(
      id: 'i6',
      title: 'Fruity Pizza',
      description:
          'Peanut Butter & Jelly Pizza with fresh berries, We love the fresh-roasted peanut taste, which pairs deliciously with jelly. Gotta love jelly pizza!',
      price: 16.99,
      imageUrl:
          'https://images.unsplash.com/photo-1560180474-e8563fd75bab?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    GiftCard(
      id: 'i7',
      title: 'Fruity Pizza',
      description:
          'Peanut Butter & Jelly Pizza with fresh berries, We love the fresh-roasted peanut taste, which pairs deliciously with jelly. Gotta love jelly pizza!',
      price: 16.99,
      imageUrl:
          'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?ixlib=rb-1.2.1&auto=format&fit=crop&w=1014&q=80',
    ),
    GiftCard(
      id: 'i4',
      title: 'Fruity Pizza',
      description:
          'Peanut Butter & Jelly Pizza with fresh berries, We love the fresh-roasted peanut taste, which pairs deliciously with jelly. Gotta love jelly pizza!',
      price: 16.99,
      imageUrl:
          'https://images.unsplash.com/photo-1565299665067-8716c97128de?ixlib=rb-1.2.1&auto=format&fit=crop&w=582&q=80',
    ),
    GiftCard(
      id: 'i8',
      title: 'Fruity Pizza',
      description:
          'Peanut Butter & Jelly Pizza with fresh berries, We love the fresh-roasted peanut taste, which pairs deliciously with jelly. Gotta love jelly pizza!',
      price: 16.99,
      imageUrl:
          'https://images.unsplash.com/photo-1565299543923-37dd37887442?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1014&q=80',
    ),
  ];

  List<GiftCard> get items {
    return [..._items];
  }

  List<GiftCard> get usedItems {
    return _items.where((item) => item.isUsed).toList();
  }

  GiftCard findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  /// ====== After fix API uncomment this ================
  /// ====================================================
  String authToken;
  String userId;

  //List all cards own by current user
  Future<void> fetchAndSetGiftCards([bool filterByUser = false]) async {
    var url = 'https://api.cafeca.cc/api/v1/user/card';
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Token': authToken,
      });
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      if (extractedData['success'] == true) {
        _items = extractedData['data'];
      }
      if (extractedData['success'] == false) {
        // error handling...
      }
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> _removeCard(String id, String urlSegment) async {
    final url =
        'https://api.cafeca.cc/api/v1/user/card/:$id/$urlSegment?auth=$authToken';
    final existingCardIndex = _items.indexWhere((card) => card.id == id);
    var existingCard = _items[existingCardIndex];
    _items.removeAt(existingCardIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingCardIndex, existingCard);
      notifyListeners();
      throw HttpException('Could not $urlSegment Card.');
    }
    existingCard = null;
  }


// // ============ Return Card ============
// Return a card if you do not want this
  Future<void> returnCard(String id) async {
    return _removeCard(id, 'return');
  }

  // ============ Take Card  ???? ============
// Take a card and write a receipt
  Future<void> addCard(GiftCard card) async {
    final url = 'https://api.cafeca.cc/api/v1/user/card?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': card.title,
          'description': card.description,
          'imageUrl': card.imageUrl,
          'price': card.price,
          'isUsed': card.isUsed,
          'from': userId,
        }),
      );
      final newCard = GiftCard(
        title: card.title,
        description: card.description,
        imageUrl: card.imageUrl,
        price: card.price,
        isUsed: card.isUsed,
        from: card.from,
        id: json.decode(response.body)['name'],
      );
      _items.add(newCard);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  /// ====================================================
  /// ====================================================
}
