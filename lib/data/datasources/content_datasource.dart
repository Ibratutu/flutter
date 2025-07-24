import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ContentDataSource {
  // Placeholder methods
}

class ContentDataSourceImpl implements ContentDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ContentDataSourceImpl(this._firestore, this._storage);
}