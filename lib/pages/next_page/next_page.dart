import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/components/text_component.dart';
import 'package:learning_getx/components/textfield_component.dart';
import 'package:learning_getx/pages/next_page/next_page_controller.dart';
import 'package:learning_getx/utils/const/app_colors.dart';
import 'package:learning_getx/utils/const/app_dimens.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NextPageController nextPageController = Get.put(NextPageController());
    TextEditingController fNum = TextEditingController();
    TextEditingController lNum = TextEditingController();

    String title = 'Random Number';
    String title2 = '';

    String errorText = '';
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
                      color: AppColors.colorWhite,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<NextPageController>(
                            id: "randomNumber",
                            builder: (context) {
                              return TextComponent(
                                text: title2.isEmpty ? title : title2,
                                colorText: AppColors.appBarColor,
                                fontWeight: FontWeight.bold,
                                textSize: AppDimens.icon_size_30,
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60.0, vertical: 10.0),
                          child: TextFieldComponent(
                            textEditingController: fNum,
                            text:
                                fNum.text.isEmpty ? 'First number' : fNum.text,
                            textInputType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: TextFieldComponent(
                            textEditingController: lNum,
                            text: lNum.text.isEmpty ? 'Last number' : lNum.text,
                            textInputType: TextInputType.number,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 50,
                          width: 200,
                          color: AppColors.colorBlue,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                nextPageController.randomEnter(
                                    int.parse(fNum.text), int.parse(lNum.text),
                                    (result) {
                                  title2 = result.toString();
                                  print(result.toString());
                                });
                              },
                              child: const TextComponent(
                                text: 'Enter',
                                colorText: AppColors.colorWhite,
                                textSize: AppDimens.text_size_16,
                              ),
                            ),
                          ),
                        ),
                      ],
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
