import 'dart:core';

import 'package:flutter/cupertino.dart';

class AddressAddingModel {
  final String title;
  final String subTitle;
  final IconData icon;

  AddressAddingModel({
    required this.title,
    required this.icon,
    required this.subTitle,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subTitle": subTitle,
      "icon": {
        "codePoint": icon.codePoint,
        "fontFamily": icon.fontFamily,
        "fontPackage": icon.fontPackage,
      },
    };
  }

  factory AddressAddingModel.fromJson(Map<String, dynamic> json) {
    return AddressAddingModel(
      title: json['title'],
      subTitle: json['subTitle'],
      //IconData (what you’re using for icons) cannot be directly serialized to JSON because it’s just a Dart object that represents an icon, not a string/number.
      icon: IconData(
        json["icon"]["codePoint"],
        fontFamily: json["icon"]["fontFamily"],
        fontPackage: json["icon"]["fontPackage"],
      ),
    );
  }
}
