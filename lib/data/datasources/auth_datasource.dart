import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthDataSource {
  // Placeholder methods
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthDataSourceImpl(this._auth, this._firestore);
}