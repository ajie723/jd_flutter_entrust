import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../utils/utils.dart';
import '../widget/dialogs.dart';
import '../widget/number_text_field_widget.dart';
import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //设置背景
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.blueAccent],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        //添加登录UI
        children: [
          const SizedBox(height: 30),
          Image.asset(
            'lib/res/images/ic_logo.png',
            width: 130,
            height: 130,
          ),
          const Center(
              child: Text(
                'Gold Emperor',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              )),
          const Center(child: LoginPick(isReLogin: false)),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class LoginPick extends StatefulWidget {
  const LoginPick({super.key, required this.isReLogin});

  final bool isReLogin;

  @override
  State<LoginPick> createState() => _LoginPickState();
}

class _LoginPickState extends State<LoginPick>
    with SingleTickerProviderStateMixin {
  var logic = Get.put(LoginLogic());
  var state = Get.find<LoginLogic>().state;

  ///tab控制器
  late var tabController = TabController(
    length: GetPlatform.isAndroid ? 2 : 2,
    vsync: this,
  );

  ///验证码密码输入框控制器
  var codeLoginPasswordController = TextEditingController();

  ///手机登录手机号输入框控制器
  var phoneLoginPhoneController = TextEditingController()
    ..text = spGet(spSaveLoginPhone) ?? '';

  ///验证码登录的手机号输入框控制器
  var codeLoginPhoneController = TextEditingController()
    ..text = spGet(spSaveLoginCode) ?? '';

  ///手机登录密码输入框控制器
  var phoneLoginPasswordController = TextEditingController()..text = '';

  ///手机登录验证码输入框控制器
  late var phoneLoginVCodeController = TextEditingController()
    ..text = state.getDebugVCode();



  ///工号登录密码输入框控制器
  var workLoginPasswordController = TextEditingController();

  textField({
    required TextEditingController controller,
    required String hint,
    required Icon leftIcon,
    required int maxLength,
    bool isPassword = false,
  }) =>
      TextField(
        obscureText: isPassword,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          counterStyle: const TextStyle(color: Colors.white),
          prefixIcon: leftIcon,
          suffixIcon: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              controller.clear();
            },
          ),
        ),
        maxLength: maxLength,
      );

  _box(Widget child) => Wrap(
    children: [
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.blueAccent,
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(20),
        child: child,
      )
    ],
  );



  _phoneLogin() => _box(
    Column(
      children: [
        textField(
          controller: phoneLoginPhoneController,
          hint: 'login_hint_machine'.tr,
          leftIcon: const Icon(Icons.precision_manufacturing, color: Colors.white),
          maxLength: 11,
        ),
        textField(
          controller: phoneLoginPasswordController,
          hint: 'login_hint_password'.tr,
          leftIcon: const Icon(Icons.lock_outline, color: Colors.white),
          maxLength: 10,
          isPassword: true,
        ),
      ],
    ),
  );

  _codeLogin() => _box(
    Column(
      children: [
        textField(
          controller: codeLoginPhoneController,
          hint: 'login_hint_phone'.tr,
          leftIcon: const Icon(Icons.precision_manufacturing, color: Colors.white),
          maxLength: 11,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: NumberTextField(
                numberController: codeLoginPasswordController,
                maxLength: 6,
                textStyle: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'login_hint_verify_code'.tr,
                  hintStyle: const TextStyle(color: Colors.white),
                  counterStyle: const TextStyle(color: Colors.white),
                  prefixIcon:
                  const Icon(Icons.email_outlined, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                state.buttonName.value == 'get_verify_code'.tr
                    ? Colors.white
                    : Colors.grey.shade400,
              ),
              onPressed: () => logic.getVerifyCode(
                codeLoginPasswordController.text,
              ),
              child: Text(
                state.buttonName.value,
                style: const TextStyle(
                  color: Color.fromARGB(255, 213, 41, 42),
                ),
              ),
            )),
          ],
        )
      ],
    ),
  );

  @override
  void initState() {
    state.isReLogin = widget.isReLogin;
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 400,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: TabBar(
          controller: tabController,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.greenAccent,
          labelColor: Colors.greenAccent,
          unselectedLabelColor: Colors.white,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          tabs: const [
            Tab(icon: Icon(Icons.precision_manufacturing)),
            // Tab(icon: Icon(Icons.message)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  _phoneLogin(),
                  // _codeLogin()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  if (tabController.index == 0) {
                    logic.phoneOrCodeLogin(
                        phoneLoginPhoneController.text,
                        phoneLoginPasswordController.text,
                        phoneLoginVCodeController.text,
                        true
                    );
                    return;
                  }
                  //
                  // if (tabController.index == 1) {
                  //   logic.phoneOrCodeLogin(
                  //       codeLoginPhoneController.text,
                  //       codeLoginPasswordController.text,
                  //       phoneLoginVCodeController.text,
                  //       false
                  //   );
                  //   return;
                  // }
                },
                child: Text(
                  'login'.tr,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
