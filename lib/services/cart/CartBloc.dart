import 'dart:collection';

import 'package:basic_store/model/models.dart';
import 'package:flutter/material.dart';

class CartBloc extends ChangeNotifier {
  Map<String, int> _itemCount = new Map();
  Map<String, Item> _items = new Map();

  UnmodifiableMapView<Item, int> get items => UnmodifiableMapView(_mapItems());

  int countElementInCart(String itemId) {
    return _itemCount[itemId] ?? 0;
  }

  int countElementsInCart() {
    return _itemCount.values.fold(0, (i, j) => i + j);
  }

  Item addItemToCart(Item item) {
    _items[item?.id] ??= item;
    _itemCount[item?.id] = 1 + countElementInCart(item?.id);
    _items[item?.id] = item; // Update the item if it has changed
    notifyListeners();
    return item;
  }

  bool removeItemFromCart(String id) {
    int elementsInCart = countElementInCart(id);
    if (elementsInCart <= 1) {
      _items.remove(id);
      _itemCount.remove(id);
    } else {
      _itemCount[id] = elementsInCart - 1;
    }
    notifyListeners();
    return true;
  }

  Map<Item, int> _mapItems() => Map.fromIterable(_items.values,
      key: (item) => item, value: (item) => countElementInCart(item.id));
}
