import 'dart:convert';

List<KHACH> KHACHFromJson(String str) => List<KHACH>.from(json.decode(str).map((x) => KHACH.fromJson(x)));

String KHACHToJson(List<KHACH> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KHACH {
  String makhachhang;
  String tenkhachhang;
  String diachi;
  String sdt;
  String email;
  String avatar;
  String tendangnhap;
  String matkhau;

  KHACH({
    required this.makhachhang,
    required this.tenkhachhang,
    required this.diachi,
    required this.sdt,
    required this.email,
    required this.avatar,
    required this.tendangnhap,
    required this.matkhau,

  });

  factory KHACH.fromJson(Map<String, dynamic> json) => KHACH(

    makhachhang: json["makhachhang"],
    tenkhachhang: json["tenkhachhang"],
    diachi: json["diachi"],
    sdt: json["sdt"],
    email: json["email"],
    avatar: json["avatar"],
    tendangnhap: json["tendangnhap"],
    matkhau: json["matkhau"],
  );

  Map<String, dynamic> toJson() => {
    "makhachhang": makhachhang,
    "tenkhachhang": tenkhachhang,
    "diachi": diachi,
    "sdt": sdt,
    "email": email,
    "avatar": avatar,
    "tendangnhap": tendangnhap,
    "matkhau":matkhau,
  };
}