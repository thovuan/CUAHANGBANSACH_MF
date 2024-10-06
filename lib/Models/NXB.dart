// To parse this JSON data, do
//
//     final nxb = nxbFromJson(jsonString);

import 'dart:convert';

List<Nxb> nxbFromJson(String str) => List<Nxb>.from(json.decode(str).map((x) => Nxb.fromJson(x)));

String nxbToJson(List<Nxb> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nxb {
  String manxb;
  String tennxb;
  String? avatar;
  int count;

  Nxb({
    required this.manxb,
    required this.tennxb,
    required this.avatar,
    required this.count,
  });

  factory Nxb.fromJson(Map<String, dynamic> json) => Nxb(
    manxb: json["manxb"],
    tennxb: json["tennxb"],
    avatar: json["avatar"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "manxb": manxb,
    "tennxb": tennxb,
    "avatar": avatar,
    "count": count,
  };
}