import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class FirebaseAPI {
  static Future<String> getIdToken(
      {required String email, required String password}) async {
    try {
      Uri link = Uri.https(
        'identitytoolkit.googleapis.com',
        '/v1/accounts:signInWithPassword',
        {'key': 'AIzaSyDF_bn1c0xf9etMzHx0yywlYG93C5JS6k0'},
      );
      var response = await http.post(
        link,
        body: {
          "email": email,
          "password": password,
          "returnSecureToken": 'true',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(
          response.body,
        ) as Map<String, dynamic>;

        return decodedResponse['idToken'];
      } else {
        throw Exception('Error');
      }
    } on SocketException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static void deleteAuth({
    required String email,
    required String password,
    required String idToken,
  }) async {
    try {
      Uri link = Uri.https(
        'identitytoolkit.googleapis.com',
        '/v1/accounts:delete',
        {'key': 'AIzaSyDF_bn1c0xf9etMzHx0yywlYG93C5JS6k0'},
      );
      var response = await http.post(
        link,
        body: {
          "idToken": idToken,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Error');
      }
    } on SocketException {
      rethrow;
    } on Exception {
      log('here at delete');
      rethrow;
    }
  }

  static void updatePassword({
    required String newPassword,
    required String idToken,
  }) async {
    try {
      Uri link = Uri.https(
        'identitytoolkit.googleapis.com',
        '/v1/accounts:update',
        {'key': 'AIzaSyDF_bn1c0xf9etMzHx0yywlYG93C5JS6k0'},
      );
      var response = await http.post(
        link,
        body: {
          "idToken": idToken,
          "password": newPassword,
          "returnSecureToken": 'true',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to Update User Password Auth');
      }
    } on SocketException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
