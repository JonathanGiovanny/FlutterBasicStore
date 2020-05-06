import 'package:basic_store/model/CustomException.dart';
import 'package:basic_store/model/auth_models.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _mapUser(FirebaseUser user) {
    return user != null ? User(id: user.uid) : null;
  }

  // User change Stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_mapUser);
  }

  // Sing in Anon
  Future<Either<CustomException, User>> singInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return Right(_mapUser(user));
    } catch (ex) {
      print(ex.toString());
      PlatformException e = ex;
      return Left(
        CustomException(userMessage: e.message),
      );
    }
  }

  // Sing In
  Future<Either<CustomException, User>> singIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return Right(_mapUser(user));
    } catch (ex) {
      print(ex.toString());
      PlatformException e = ex;
      return Left(
        CustomException(userMessage: e.message),
      );
    }
  }

  // Sing Out
  Future<void> singOut() async {
    try {
      return await _auth.signOut();
    } catch (ex) {
      print(ex.toString());
      PlatformException e = ex;
      return Left(
        CustomException(userMessage: e.message),
      );
    }
  }

  // Register
  Future<Either<CustomException, User>> register(
      String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return Right(_mapUser(user));
    } catch (ex) {
      print(ex.toString());
      PlatformException e = ex;
      return Left(
        CustomException(userMessage: e.message),
      );
    }
  }
}
