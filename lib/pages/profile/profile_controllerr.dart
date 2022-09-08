import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/models/profile_model.dart';
import 'package:learning_getx/pages/next_page/next_page.dart';
import 'package:learning_getx/services/dio_client.dart';

class ProfileController extends GetxController {
  ProfileModel profileModel = ProfileModel();

  getProfile() {
    Dio dio = Dio();
    DioClient dioClient = DioClient(dio: dio);
    Map<String, dynamic> body = {
      "userID": "42330.0",
      "k": "WYnIZVbJD5wSL+Pp8pmR8xUNuGA=",
      "dm": "https://mydtu.duytan.edu.vn",
      "tk": "162f8b44d0be05176c0fb8115ee465ee",
      "ttl": DateTime.now().ticks.toString(),
    };

    dioClient.postAsync(
        'http://dev.duytan.edu.vn:8007/mydtuApi2022/api/GetProfile',
        body: body, errorCallBack: (e) {
      log(e);
    }, callBack: (data) {
      profileModel = ProfileModel.fromJson(data);
      update(['updateProfile']);
    });
  }

  onTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NextPage()));
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }
}

const _epochTicks = 621356220000000000;

extension TicksOnDateTime on DateTime {
  int get ticks => microsecondsSinceEpoch * 10 + _epochTicks;
}
