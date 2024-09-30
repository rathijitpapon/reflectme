import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum NetworkMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class NetworkUtility {
  static Future<String?> fetchUrl(
    NetworkMethod method,
    Uri uri,
    {Map<String, String>? headers}
  ) async {
    try {
      final response = switch (method) {
        NetworkMethod.get => await http.get(uri, headers: headers),
        NetworkMethod.post => await http.post(uri, headers: headers),
        NetworkMethod.put => await http.put(uri, headers: headers),
        NetworkMethod.patch => await http.patch(uri, headers: headers),
        NetworkMethod.delete => await http.delete(uri, headers: headers),
      };

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        debugPrint(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
