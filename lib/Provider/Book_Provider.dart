import 'dart:convert';

import 'package:cuahangbansach/Models/Book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Book_Provider with ChangeNotifier {
  List<SACH> _book = [];
  List<SACH> get book => _book;

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/v1/QLSACH')); // URL của API
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _book = data.map((item) => SACH.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load Book');
    }
  }
}