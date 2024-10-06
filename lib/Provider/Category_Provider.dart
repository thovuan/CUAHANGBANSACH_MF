import 'dart:convert';

import 'package:cuahangbansach/Models/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Category_Provider with ChangeNotifier {
  List<Theloaisach> _tls = [];
  List<Theloaisach> get tls => _tls;

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/v1/QLTHELOAI')); // URL của API
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _tls = data.map((item) => Theloaisach.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load TL');
    }
  }
}