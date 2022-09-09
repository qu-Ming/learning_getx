import 'package:flutter/material.dart';
import 'package:learning_getx/utils/const/app_colors.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    Key? key,
    required this.text,
    this.textInputType,
    required this.textEditingController,
  }) : super(key: key);

  final String text;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide(width: 1)),
          disabledBorder:
              const OutlineInputBorder(borderSide: BorderSide(width: 1)),
          // labelText: 'Email Address',
          hintText: text,
          hintStyle: const TextStyle(
              color: AppColors.colorBlack, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
