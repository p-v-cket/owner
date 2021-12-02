import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  late FlutterSecureStorage storage;
  String? accessToken;

  AuthProvider() {
    storage = new FlutterSecureStorage();
  }

  setAccessToken(String token) {
    accessToken = token;
    storage.write(key: 'access_token', value: accessToken);

    notifyListeners();
  }

  isValid() async {
    accessToken = await storage.read(key: 'access_token') ?? null;

    // TODO: api에서 유효한 토큰인지 검증 후 리턴 할 것
    if (accessToken != null) return true;
    return false;
  }

  logout() {
    accessToken = null;
    storage.delete(key: 'access_token');

    notifyListeners();
  }
}