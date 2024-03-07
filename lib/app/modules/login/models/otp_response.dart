// To parse this JSON data, do
//
//     final otp = otpFromJson(jsonString);

import 'dart:convert';

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

class Otp {
    String status;
    String token;
    String refno;

    Otp({
        required this.status,
        required this.token,
        required this.refno,
    });

    factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        status: json["status"],
        token: json["token"],
        refno: json["refno"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "refno": refno,
    };
}
