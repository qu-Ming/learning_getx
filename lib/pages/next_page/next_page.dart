import 'package:flutter/material.dart';
import 'package:learning_getx/components/text_component.dart';
import 'package:learning_getx/pages/next_page/next_page_controller.dart';
import 'package:learning_getx/utils/const/app_colors.dart';
import 'package:learning_getx/utils/const/app_dimens.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBarColor,
        title: const TextComponent(
          text: 'Next page',
          textSize: AppDimens.text_size_20,
          colorText: AppColors.colorWhite,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            NextPageController().onClickIconReturn(context);
          },
          child: const Icon(
            Icons.chevron_left,
            size: 34.0,
          ),
        ),
      ),
    );
  }
}
