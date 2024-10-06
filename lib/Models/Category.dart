// To parse this JSON data, do
//
//     final theloaisach = theloaisachFromJson(jsonString);

import 'dart:convert';

List<Theloaisach> theloaisachFromJson(String str) => List<Theloaisach>.from(json.decode(str).map((x) => Theloaisach.fromJson(x)));

String theloaisachToJson(List<Theloaisach> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Theloaisach {
  String matheloai;
  String tentheloai;
  String? avatar;
  int count;

  Theloaisach({
    required this.matheloai,
    required this.tentheloai,
    required this.avatar,
    required this.count,
  });

  factory Theloaisach.fromJson(Map<String, dynamic> json) => Theloaisach(
    matheloai: json["matheloai"],
    tentheloai: json["tentheloai"],

    count: json["count"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "matheloai": matheloai,
    "tentheloai": tentheloai,

    "count": count,
    "avatar": avatar,
  };
}
