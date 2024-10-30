import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/utils/utils.dart';
import 'package:jd_flutter_for_entrust/widget/custom_widget.dart';

import '../constant.dart';
import '../labelReport/label_report_view.dart';
import '../purchase/purchase_order_view.dart';
import '../widget/dialogs.dart';
import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  ///用户头像
  late Widget userAvatar;

  @override
  void onInit() {
    super.onInit();
    userAvatar = Obx(
          () => state.userPicUrl.value.isEmpty
          ? const Icon(Icons.person_2_outlined, color: Colors.white,size: 50,)
          : ClipOval(child: Image.network(userInfo!.picUrl!)),
    );
  }

  goPage(int index) {
    if(index==0){
      Get.to(() => const PurchaseOrderPage());
    }else{
      Get.to(() => const LabelReportPage());
    }
  }

  ///底部弹窗
  takeAvatarPhoto() {
    takePhoto((f) {
      state.changeUserAvatar(
        file: f,
        success: (s) => showSnackBar(
          title: 'home_user_setting_avatar_photo_sheet_title'.tr,
          message: s,
        ),
        error: (s) => errorDialog(content: s),
      );
    }, title: 'home_user_setting_avatar_photo_sheet_title'.tr);
  }

  changePassword(String oldPassword, String newPassword) {
    if (oldPassword.isEmpty) {
      errorDialog(content: 'change_password_dialog_old_password'.tr);
      return;
    }
    if (oldPassword.md5Encode().toUpperCase() != userInfo!.passWord) {
      errorDialog(content: 'change_password_dialog_old_password_error'.tr);
      return;
    }
    if (newPassword.isEmpty) {
      errorDialog(content: 'change_password_dialog_new_password'.tr);
      return;
    }
    var phone = '';
    switch (spGet(spSaveLoginType)) {
      case loginTypePhone:
        phone = spGet(spSaveLoginPhone);
        break;
      case loginTypeFace:
        phone = spGet(spSaveLoginFace);
        break;
    }
    state.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      phone: phone,
      success: (msg) => successDialog(content: msg, back: () => Get.back()),
      error: (msg) => errorDialog(content: msg),
    );
  }
}
