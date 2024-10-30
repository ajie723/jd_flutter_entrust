
import 'dart:io';

import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/utils/utils.dart';

import '../utils/web_api.dart';

class HomeState{

  var userPicUrl = ''.obs;

  HomeState() {
    userPicUrl.value = userInfo?.picUrl ?? '';
  }


  changeUserAvatar({
    required File file,
    required Function(String msg) success,
    required Function(String msg) error,
  }) {
    httpPost(
      loading: 'home_user_setting_avatar_photo_submitting'.tr,
      method: webApiChangeUserAvatar,
      body: {
        'imageBase64': File(file.path).toBase64(),
        'empID': userInfo!.empID!,
        'userID': userInfo!.userID!,
      },
    ).then((response) {
      if (response.resultCode == resultSuccess) {
        success.call(response.message ?? '');
      } else {
        error.call(response.message ?? '');
      }
    });
  }

  changePassword({
    required String oldPassword,
    required String newPassword,
    required String phone,
    required Function(String msg) success,
    required Function(String msg) error,
  }) {
    httpPost(
      loading: 'change_password_dialog_submitting'.tr,
      method: webApiChangePassword,
      params: {
        'OldPassWord': oldPassword,
        'NewPassWord': newPassword,
        'PhoneNumber': phone
      },
    ).then((response) {
      if (response.resultCode == resultSuccess) {
        success.call(response.message ?? '');
      } else {
        error.call(response.message ?? '');
      }
    });
  }
}