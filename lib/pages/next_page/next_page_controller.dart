import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPageController extends GetxController {
  onClickIconReturn(BuildContext context) {
    Navigator.of(context).pop(true);
  }

  cancelKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  onEnterButton() {}
}
