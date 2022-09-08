import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/components/text_component.dart';
import 'package:learning_getx/components/textfield_component.dart';
import 'package:learning_getx/pages/profile/profile_controllerr.dart';
import 'package:learning_getx/utils/const/app_colors.dart';
import 'package:learning_getx/utils/const/app_dimens.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.appBarColor,
          title: TextComponent(
            text: 'Profile',
            textSize: AppDimens.text_size_20,
            colorText: AppColors.colorWhite,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              ProfileController().getProfile();
            },
            child: const Icon(
              Icons.chevron_left,
              size: 34,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<ProfileController>(
            id: ('updateProfile'),
            builder: (_) => Column(
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  Container(
                    padding: const EdgeInsets.all(45),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.appBarColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(70, 50),
                        bottomRight: Radius.elliptical(70, 50),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -25,
                    right: 0,
                    left: 0,
                    child: CachedNetworkImage(
                      imageUrl:
                          profileController.profileModel.picture.toString(),
                      placeholder: (context, url) => const CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 50,
                      ),
                      imageBuilder: (context, image) => Center(
                        child: CircleAvatar(
                          backgroundImage: image,
                          radius: 55,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.backGourndColor,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: TextComponent(
                    text:
                        '${profileController.profileModel.currentLastName} ${profileController.profileModel.currentMiddleName} ${profileController.profileModel.currentFirstName}',
                    textSize: AppDimens.text_size_22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextComponent(
                    text: 'ID Student: ' +
                        profileController.profileModel.studentIdNumber
                            .toString(),
                    textSize: AppDimens.text_size_14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(text: 'Email'),
                      TextfieldComponent(
                          text: profileController.profileModel.currentEmail
                              .toString()),
                      TextComponent(text: 'Identity card'),
                      TextfieldComponent(
                          text: profileController.profileModel.peopleIdNumber
                              .toString()),
                      TextComponent(text: 'Phone'),
                      TextfieldComponent(
                          text: profileController.profileModel.currentPhone
                              .toString()),
                      TextComponent(
                        text: 'Address'.toString(),
                      ),
                      TextfieldComponent(
                          text:
                              '${profileController.profileModel.currentAddress} ${profileController.profileModel.contactCountry}'),
                      TextComponent(
                        text: 'Day of birth'.toString(),
                      ),
                      TextfieldComponent(
                          text: '${profileController.profileModel.birthDate}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
