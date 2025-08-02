// To parse this JSON data, do
//
//     final signupbody = signupbodyFromJson(jsonString);

import 'dart:convert';

Signupbody signupbodyFromJson(String str) => Signupbody.fromJson(json.decode(str));

String signupbodyToJson(Signupbody data) => json.encode(data.toJson());

class Signupbody {
  String? mobilePhone;
  String? emailId;
  String? firstName;
  String? lastName;
  String? zipcode;
  String? city;
  String? community;
  String? street;
  String? aptNumber;
  String? country;
  String? state;

  Signupbody({
    this.mobilePhone,
    this.emailId,
    this.firstName,
    this.lastName,
    this.zipcode,
    this.city,
    this.community,
    this.street,
    this.aptNumber,
    this.country,
    this.state,
  });

  factory Signupbody.fromJson(Map<String, dynamic> json) => Signupbody(
    mobilePhone: json["mobile_phone"],
    emailId: json["email_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    zipcode: json["zipcode"],
    city: json["city"],
    community: json["community"],
    street: json["street"],
    aptNumber: json["aptNumber"],
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "mobile_phone": mobilePhone,
    "email_id": emailId,
    "first_name": firstName,
    "last_name": lastName,
    "zipcode": zipcode,
    "city": city,
    "community": community,
    "street": street,
    "aptNumber": aptNumber,
    "country": country,
    "state": state,
  };
}
