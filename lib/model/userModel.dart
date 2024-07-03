import 'package:flutter/cupertino.dart';

class Sala7lyUserModel extends ChangeNotifier{
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  Sala7lyUserModel({this.firstName, this.lastName, this.email, this.phone});

  factory Sala7lyUserModel.fromJson(Map<String, dynamic> json) {
    return Sala7lyUserModel(
      firstName: json['FName'],
      lastName: json['LName'],
      email: json['Email'],
      phone: json['Phone'],
    );
  }
}
