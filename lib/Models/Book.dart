import 'dart:convert';

import 'package:cuahangbansach/Models/Category.dart';
import 'package:cuahangbansach/Models/NXB.dart';

List<SACH> SACHFromJson(String str) => List<SACH>.from(json.decode(str).map((x) => SACH.fromJson(x)));

String SACHToJson(List<SACH> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SACH {
  String masach;
  String tensach;
  int soluonghienco;
  String? dacdiem;
  String? anhsanpham;
  String DVT;
  int dongia;

  String theloaisachId; // Chỉ lưu trữ ID thay vì toàn bộ đối tượng
  String nxbId; // Chỉ lưu trữ ID thay vì toàn bộ đối tượng
  String mnvID;

  SACH({
    required this.masach,
    required this.tensach,
    required this.soluonghienco,
    required this.dacdiem,
    required this.anhsanpham,
    required this.dongia,
    required this.DVT,
    required this.theloaisachId, // ID của thể loại sách
    required this.nxbId, // ID của nhà xuất bản
    required this.mnvID
  });

  factory SACH.fromJson(Map<String, dynamic> json) => SACH(
    masach: json["masach"],
    tensach: json["tensach"],
    soluonghienco: json["soluonghienco"],
    dacdiem: json["dacdiem"],
    anhsanpham: json["anhsanpham"],
    dongia: json["dongia"],
    DVT: json["dvt"],
    theloaisachId: json["matheloai"], // Chỉ nhận ID
    nxbId: json["manxb"], // Chỉ nhận ID
    mnvID: json["manhanvien"],
  );

  Map<String, dynamic> toJson() => {
    "masach": masach,
    "tensach": tensach,
    "soluonghienco": soluonghienco,
    "dacdiem": dacdiem,
    "anhsanpham": anhsanpham,
    "dongia": dongia,
    "dvt": DVT,
    "matheloai": theloaisachId, // Gửi ID của thể loại sách
    "manxb": nxbId, // Gửi ID của nhà xuất bản
    "manhanvien": mnvID,
  };
}