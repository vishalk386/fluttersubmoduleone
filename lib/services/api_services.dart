import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/photo_model.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
   const String url = "https://jsonplaceholder.typicode.com/photos";
  final response = await http.get(Uri.parse(url));
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}