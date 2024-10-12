
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jd_flutter/utils/utils.dart';
import '../bean/home_button.dart';
import '../bean/http/response/department_info.dart';
import '../constant.dart';
import '../route.dart';
import '../widget/custom_widget.dart';
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
          ? const Icon(Icons.flutter_dash, color: Colors.white)
          : ClipOval(child: Image.network(userInfo!.picUrl!)),
    );
  }

  refreshFunList({required Function() refresh}) {
    state.refreshFunList(
      success: () {
        refreshButton();
        refresh.call();
      },
      error: (msg) {
        errorDialog(content: msg);
      },
    );
  }

  search(String text) {
    state.search = text;
    refreshButton();
  }

  navigationBarClick(int index) {
    state.nBarIndex = index;
    refreshButton();
  }

  refreshButton() {
    state.buttons.clear();
    if (state.search.isEmpty) {
      state.buttons.addAll(
        functions.where((v) =>
            v.classify == state.navigationBar[state.nBarIndex].className),
      );
    } else {
      var list = <ButtonItem>[];
      for (var fun in functions) {
        if (fun is HomeButtonGroup) {
          list.addAll(fun.functionGroup);
        } else {
          list.add(fun);
        }
      }
      state.buttons.addAll(
        list.where((v) =>
            v.name.toUpperCase().contains(state.search.toUpperCase()) ||
            v.description.toUpperCase().contains(state.search.toUpperCase())),
      );
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

  ///部门列表弹窗
  getDepartment(Function(List<Department> list, int index) callback) {
    state.getDepartment(
      success: (list) {
        //查询当前部门下标
        int selected = list.indexWhere((element) {
          return element.name == userInfo?.departmentName;
        });
        if (selected < 0) selected = 0;
        callback.call(list, selected);
      },
      error: (s) => errorDialog(content: s),
    );
  }

  changeDepartment(Department data) {
    state.changeDepartment(
      departmentID: data.itemID ?? 0,
      success: () => Get.back(),
      error: (s) => errorDialog(content: s),
    );
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
