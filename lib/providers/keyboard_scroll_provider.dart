import 'package:flutter/material.dart';

class KeyboardScrollProvider extends ChangeNotifier {
  late ScrollController controller;

  void attach(ScrollController c) {
    controller = c;
  }

  void up() {
    controller.animateTo(
      controller.offset - 200,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }

  void down() {
    controller.animateTo(
      controller.offset + 200,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }
}
