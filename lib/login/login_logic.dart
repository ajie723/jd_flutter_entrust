import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/utils/web_api.dart';

import '../home/home_view.dart';
import '../utils/utils.dart';
import '../widget/custom_widget.dart';
import '../widget/dialogs.dart';
import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  ///获取验证码
  getVerifyCode(String phone) {
    //按钮名称不是获取验证码，直接返回
    if (state.buttonName.value != 'get_verify_code'.tr) return;

    //手机号为空，提示
    if (phone.isEmpty) {
      errorDialog(content: 'login_hint_phone'.tr);
      return;
    }
    state.getVerificationCode(
      phone: phone,
      success: () {
        showSnackBar(
          title: 'get_verify_code'.tr,
          message: 'phone_login_get_verify_code_success'.tr,
        );
      },
      error: (msg) => errorDialog(content: msg),
    );
  }

  // /// 机台号登录
  phoneOrCodeLogin(
      String phone,
      String password,
      String vCode,
      bool isPassWord,
      ) {
    hideKeyBoard();

    if (phone.isEmpty) {
      errorDialog(content: 'login_tips_phone'.tr);
      return;
    }

    if (isPassWord) {
      if (password.isEmpty) {
        errorDialog(content: 'login_tips_password'.tr);
        return;
      }
    } else {
      if (vCode.isEmpty) {
        errorDialog(content: 'login_tips_verify_code'.tr);
        return;
      }
    }

    state.login(
      phone: phone,
      password: password,
      vCode: vCode,
      success: (userInfo) {
        logger.f('跳转');
        Get.offAll(() => const HomePage());
      },
      error: (msg) => errorDialog(content: msg),
    );
  }
}
