import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/components/container_profile_component.dart';
import 'package:learning_getx/components/text_component.dart';
import 'package:learning_getx/pages/profile/profile_controllerr.dart';
import 'package:learning_getx/utils/const/app_colors.dart';
import 'package:learning_getx/utils/const/app_dimens.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.appBarColor,
      title: const TextComponent(
        text: 'Profile',
        textSize: AppDimens.text_size_20,
        colorText: AppColors.colorWhite,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          iconSize: 34.0,
          onPressed: () {
            profileController.onTap(context);
          },
        )
      ],
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          ProfileController().getProfile();
        },
        child: const Icon(
          Icons.refresh,
          size: 30.0,
        ),
      ),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: GetBuilder<ProfileController>(
        id: ('updateProfile'),
        builder: (context) => Column(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                padding: const EdgeInsets.all(50),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.appBarColor,
                ),
              ),
              Positioned(
                bottom: -20,
                right: 0,
                left: 0,
                child: CachedNetworkImage(
                  imageUrl: profileController.profileModel.picture.toString(),
                  placeholder: (context, url) => const CircleAvatar(
                    backgroundColor: AppColors.backGourndColor,
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
              padding: const EdgeInsets.only(top: 24),
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
                    profileController.profileModel.studentIdNumber.toString(),
                textSize: AppDimens.text_size_14,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerProfileComponent(
                    text:
                        profileController.profileModel.currentEmail.toString(),
                    icon: Icons.email,
                  ),
                  ContainerProfileComponent(
                    text: profileController.profileModel.peopleIdNumber
                        .toString(),
                    icon: Icons.person,
                  ),
                  ContainerProfileComponent(
                    text:
                        profileController.profileModel.currentPhone.toString(),
                    icon: Icons.phone_android,
                  ),
                  ContainerProfileComponent(
                    text:
                        '${profileController.profileModel.currentAddress} ${profileController.profileModel.contactCountry}'
                            .toString(),
                    icon: Icons.home_filled,
                  ),
                  ContainerProfileComponent(
                    text: profileController.profileModel.birthDate.toString(),
                    icon: Icons.cake,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
