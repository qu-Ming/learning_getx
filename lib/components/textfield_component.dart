import 'package:flutter/material.dart';
import 'package:learning_getx/utils/const/app_colors.dart';

class TextfieldComponent extends StatelessWidget {
  TextfieldComponent({Key? key, this.enabled = false, required this.text})
      : super(key: key);

  bool? enabled;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      child: TextField(
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1)),
          enabled: false,
          // labelText: 'Email Address',
          hintText: text,
          hintStyle: const TextStyle(
              color: AppColors.colorBlack, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}