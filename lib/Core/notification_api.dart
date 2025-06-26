import 'dart:convert';
import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

class FCMAPI {
  // final Dio dio = Dio();

  static Future<String> _getAccessToken() async {
    Map<String, String> serviceAccountData = {
      "type": "service_account",
      "project_id": "uccd-f607e",
      "private_key_id": "b3781c4d2a442ac3dbc06669f65c8c95c9388450",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCpzpvXzs9qY1pE\nFAO3m153GgMiuzgXTZz8zcTdkLbyr/oMb1ZncUnS/9PJGo3ghi8YIIMmxsi4tf7U\nFyDGmzbHRX0KB8sQKOnZATQpKXg6V0Ahkenb0y4Fn29LHk8NeMmeQDkIX+Ub717i\n874o5dfc+Z/jGxulRp1uSUnmBlmGFjN3buHrEYwnnGcdAVNRj3Jcg6DnwgIus6Tq\nAhFFkINndSI2LpaX3du1Ch1xyH5JwnklAazFJUCBskUFaVC1Uf4Jvz/WcBt7kOnL\nB7ktZSoYPhL2QjAHy85/R/jBchrbcloEqI2Wl4SHUqr5taMljfQuzm2hreA5z24q\ns7eFAVkpAgMBAAECggEAFMqkAV4kvnGQ1WIf/GTNQccRGDkVSqEptjiZwMld5URP\n2SLu0Papo+jILUkPkyzK6mjctixD2n4KSDzWugq6P9cN0uMWZZGk5HnFwb5+pqIV\nS6b6m/x1F6Iodemto0glY7eYZCKdwnhiRWaz430VG80C20Nv9KI7V4wovL4NSyIM\nsyH2ClAqUuF14qc4muVswmh3adgoQoMO0iFMkEh1DMRi7QF/fr5d5oWvK8zohNpg\nw1NkchL5ta4wHlH9tUX60xbWYgju6C5OtTyFjVsiwwOmUvyD1QLk83+8nqBzS5ah\nS8RyQ5CKGz17EEgYzZPmOyW7AOsfDizwy6dqR3ACQQKBgQDV0uGHvOtjILnpEBlQ\nLwDcy208FcNrehUnYcrIV28WjJaNDx/DWM2+OioVpG+BK+4XYqG9et2FLJsgrXiT\nCzopGsTkIC66uxf+QQ8j1+y6SPM1baAxjBDYfsVHcKlkEEXJjyoUk6fF1mf2DquR\nFIS7stS8vbMdVtSs8F2SMk5NuQKBgQDLTRY9UN4/hDxaSMiUirukKtlvKaTP8uXw\n3m2XpYEbBLYbwHZpc1rv+ZKIm7BsOVEVkfEtX4OB830Tg8lfXmYd7HwClLtfyofa\nmPEb5tPJBQz2z9wcIrtMD9VlQ8wtjHj1Qe6j40edQ7ZkqNZCL4MgHAO0F4utpWyV\nR4mO+OKe8QKBgC7F8o++w77rab+RxffEUGv8E+kQ2a6pBfeXbMRmW+aS2lwA8vHI\nezkhgBM75Shcc7ip2reYKNz45PZA/B8uVYqoUGmWoKI4SwdTM/yjPyWAz7LgSCqO\neSDimkUGYAeDh8CPkKTvp8OfIx6wFtelpWNpux+OX6ALXnp2GgHg/0ABAoGAVMCB\nKfShgkclRdobzFj9mpXGaWIp9ArlswF3HIYBiXrwVCdq9dECMxKO9OY6qRNH6z8Z\nFPpBf5Y7KTyCYYCf/4+LryPD7U4oTof908zps16opefHce9Et5POOVYHM2HhNxVS\nX/4q57PHwLTmBVd7SZKENLqwHybcWmslPHYjO3ECgYEAt5X7lCCll01psIVEaMso\nTk7wUCmRyj+ncYWfKaZJJLxZbJx7nuNphtSHEzdv71wbqAOurmze4NxrtwqMejYf\nlfcrzlSf193ZoEa3OfrpKWm14rSltnItSHLXRlMB2zexEhVlF8ntshrqqZxrHOlj\nLE3fEcQXzjKKWz7ViUVQv5Y=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-kiaoh@uccd-f607e.iam.gserviceaccount.com",
      "client_id": "117694178847991484558",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-kiaoh%40uccd-f607e.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    //const
    List<String> scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    //get client
    var client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountData),
      scopes,
    );

    //get client credentaials
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountData),
      scopes,
      client,
    );

    //got access token to cloud
    return credentials.accessToken.data;
  }

  static Future<void> sendToToken({
    required String deviceToken,
    required String title,
    required String body,
  }) async {
    String accessToken = await _getAccessToken();
    log(accessToken);
    String endPoint =
        'https://fcm.googleapis.com/v1/projects/uccd-f607e/messages:send';
    Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'body': body,
          'title': title,
        },
        'data': {
          'route': '',
        }
      },
    };
    try {
      var response = await http.post(
        Uri.parse(endPoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(message),
      );
      log(response.body.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> sendToTopic({
    String? topic,
    required String title,
    required String body,
  }) async {
    String accessToken = await _getAccessToken();
    log(accessToken);
    String endPoint =
        'https://fcm.googleapis.com/v1/projects/uccd-f607e/messages:send';
    Map<String, dynamic> message = {
      'message': {
        'topic': topic ?? 'basic',
        'notification': {
          'body': body,
          'title': title,
        },
        'data': {
          'route': '',
        }
      },
    };
    try {
      var response = await http.post(
        Uri.parse(endPoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(message),
      );
      log(response.body.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
