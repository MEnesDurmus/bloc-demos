import 'package:flutter/material.dart';

extension DeviceSize on BuildContext {
  get getHeight => MediaQuery.of(this).size.height;
  get getWidth => MediaQuery.of(this).size.width;
}

extension ContextUtil on BuildContext {
  showSnackBar(String text) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
}
