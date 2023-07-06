import 'package:flutter/material.dart';

class FormHelper {
  Map<String, TextEditingController> _fields = {};

  Map<String, TextEditingController> get fields => _fields;

  FormHelper(Set<String> keys) {
    keys.forEach((key) {
      _fields[key] = TextEditingController();
    });
  }

  void resetForm() {
    _fields.forEach((key, value) {
      value.clear();
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    _fields.forEach((key, value) {
      json[key] = value.text;
    });

    return json;
  }
}
