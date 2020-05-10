import 'package:basic_store/model/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsRepository {
  final CollectionReference itemsCollection =
      Firestore.instance.collection('items_repository_test');

  Item _mapItem(DocumentSnapshot document) => Item(
      id: document.data['id'],
      name: document.data['name'],
      description: document.data['description'] ?? '',
      image: document.data['image'],
      price: document.data['price'] + .0 ?? 0);

  Stream<List<Item>> get items {
    return itemsCollection.snapshots().map((snapshot) =>
        snapshot.documents.map((document) => _mapItem(document)).toList());
  }
}
