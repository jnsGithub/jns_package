import 'dart:convert';

import 'package:http/http.dart' as http;

class FunctionsClass {
  FunctionsClass();

  Future<void> sendFcm(String projectId, String title, String body, String serviceKey, String fcmToken) async {
    try{
      String accessToken = 'await getAccessToken(serviceKey)';
      final response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(<String, dynamic>{
          'message': <String, dynamic>{
            'token': fcmToken,
            'notification': <String, dynamic>{
              'title': title,
              'body': body,
            },
          },
        }),
      );
    } catch(e) {
      print(e);
    }
  }
}