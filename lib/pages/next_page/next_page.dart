import 'package:flutter/material.dart';
import 'package:learning_getx/components/text_component.dart';
import 'package:learning_getx/components/textfield_component.dart';
import 'package:learning_getx/pages/next_page/next_page_controller.dart';
import 'package:learning_getx/utils/const/app_colors.dart';
import 'package:learning_getx/utils/const/app_dimens.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          NextPageController().cancelKeyBoard();
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.colorWhite,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.appBarColor,
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  NextPageController().onClickIconReturn(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  size: AppDimens.icon_size_30,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: AppDimens.icon_size_28,
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 20, left: 20, right: 20),
                      color: AppColors.appBarColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TextComponent(
                              text: 'Welcome to!',
                              textSize: AppDimens.text_size_20,
                              colorText: AppColors.colorWhite),
                          TextComponent(
                            text: 'DTU - Duy Tan University',
                            textSize: AppDimens.text_size_28,
                            colorText: AppColors.colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                          TextComponent(
                              text: 'Application',
                              textSize: AppDimens.text_size_20,
                              colorText: AppColors.colorWhite),
                        ],
                      )),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: AppColors.colorWhite),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const TextComponent(
                            text: 'Random Number',
                            colorText: AppColors.appBarColor,
                            fontWeight: FontWeight.bold,
                            textSize: AppDimens.icon_size_30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextFieldComponent(
                            text: 'First number',
                            enabled: true,
                            textInputType: TextInputType.number,
                          ),
                          const TextFieldComponent(
                            text: 'Last number',
                            enabled: true,
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: 70,
                                color: AppColors.colorGrey,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const TextComponent(
                                      text: 'Cancel',
                                      colorText: AppColors.colorBlack,
                                      textSize: AppDimens.text_size_16,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                color: AppColors.colorBlue,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const TextComponent(
                                      text: 'Enter',
                                      colorText: AppColors.colorWhite,
                                      textSize: AppDimens.text_size_16,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
