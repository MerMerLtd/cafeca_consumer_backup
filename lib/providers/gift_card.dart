import 'package:flutter/foundation.dart';

class GiftCard with ChangeNotifier{
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

  void markUsed(){
    isUsed = true;
    notifyListeners();
  }
}
