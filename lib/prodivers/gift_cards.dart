import 'package:flutter/material.dart';

import './gift_card.dart';

class GiftCards with ChangeNotifier {
  List<GiftCard> _items = [
    GiftCard(
      id: 'i1',
      title: 'Paleo Pancakes',
      description:
          'Paleo Pancakes with Raspberries & Almond Butter. Low carbs, high protein paleo pancakes which is a good chioce for breakfast or snack after exercise',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1501199846642-3181f389551d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
      availableShopsId: [],
    ),
    GiftCard(
      id: 'i2',
      title: 'Strawberry sandwich scones',
      description:
          'There’s a pop of zest in the scone dough for brightness, and each bite has some texture from the sugared top, a bright burst of berry, and an undertone of tropical, tart passionfruit.',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1558234469-50fc184d1cc9?ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80',
      availableShopsId: [],
    ),
    GiftCard(
      id: 'i3',
      title: 'Blue berry muffin',
      description:
          'Bursting with fresh blueberries with a tender crumb and sparkling sugar crust, these really are the best blueberry muffins.',
      price: 13.99,
      imageUrl:
          'https://images.unsplash.com/photo-1560156710-0580247f9f69?ixlib=rb-1.2.1&auto=format&fit=crop&w=933&q=80',
      availableShopsId: [],
    ),
    GiftCard(
      id: 'i4',
      title: 'Fruity Pizza',
      description:
          'Peanut Butter & Jelly Pizza with fresh berries, We love the fresh-roasted peanut taste, which pairs deliciously with jelly. Gotta love jelly pizza!',
      price: 16.99,
      imageUrl:
          'https://images.unsplash.com/photo-1553097736-d7382ec6c441?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=922&q=80',
      availableShopsId: [],
    ),
  ];

  List<GiftCard> get items{
    return [..._items];
  }

  List<GiftCard> get usedCard{
    return _items.where((card) => card.isUsed).toList();
  }

  GiftCard findById(String id){
    return _items.firstWhere((card) => card.id == id);
  }

  void updateCards(){
    // 
    notifyListeners();
  }
}
