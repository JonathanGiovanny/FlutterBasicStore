import 'package:cloud_firestore/cloud_firestore.dart';

class UserHistoryRepository {
  final CollectionReference _userHistoryCollection =
      Firestore.instance.collection('user_history_test');
}
