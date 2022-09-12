import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPageController extends GetxController {
  get radomNum => null;

  onClickIconReturn(BuildContext context) {
    Navigator.of(context).pop(true);
  }

  cancelKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  int randomEnter(int min, int max) {
    int randomNum = (min) + Random().nextInt((max + 1 - min));
    update(["randomNumber"]);

    return randomNum;
  }

  String errorText() {
    String errorText = "the first number is greater than the last";
    return errorText;
  }
}
