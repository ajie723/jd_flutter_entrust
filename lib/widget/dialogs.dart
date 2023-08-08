import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jd_flutter/utils.dart';

import '../http/do_http.dart';
import '../http/web_api.dart';

/// 提示弹窗
informationDialog(BuildContext context,
    {String title = "", required String? content, Function()? back}) {
  showDialog<String>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title.isEmpty ? 'dialog_default_title_information'.tr : title,
          style: const TextStyle(color: Colors.orange)),
      content: Text(content ?? ""),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
            back?.call();
          },
          child: Text('dialog_default_got_it'.tr),
        ),
      ],
    ),
  );
}

/// 提示弹窗
successDialog(BuildContext context,
    {String title = "", required String? content, Function()? back}) {
  showDialog<String>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title.isEmpty ? 'dialog_default_title_success'.tr : title,
          style: const TextStyle(color: Colors.green)),
      content: Text(content ?? ""),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
            back?.call();
          },
          child: Text('dialog_default_got_it'.tr),
        ),
      ],
    ),
  );
}

///错误弹窗
errorDialog(BuildContext context,
    {String title = "", required String? content, Function()? back}) {
  showDialog<String>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title.isEmpty ? 'dialog_default_title_error'.tr : title,
          style: const TextStyle(color: Colors.red)),
      content: Text(content ?? ""),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
            back?.call();
          },
          child: Text('dialog_default_got_it'.tr),
        ),
      ],
    ),
  );
}

///加载中弹窗
loadingDialog(BuildContext context, String? content) {
  showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 15),
                  Text(content ?? "")
                ],
              ),
            ),
          ));
}

downloadDialog(BuildContext context, String url, Function(String) completed) {
  showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ProgressDialog(
          url: url,
          completed: (path) {
            completed.call(path);
          }));
}

///下载器
class ProgressDialog extends StatefulWidget {
  const ProgressDialog({
    Key? key,
    required this.url,
    required this.completed,
  }) : super(key: key);
  final String url;
  final Function(dynamic) completed;

  @override
  State<ProgressDialog> createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog> {
  var _progress = 0.0;
  var _text = "0%";
  final cancelToken = CancelToken();

  downloading() {
    download(
      widget.url,
      cancel: cancelToken,
      progress: (count, total) {
        setState(() {
          _progress = (count / total);
          _text = "${((_progress * 1000).ceil() / 10)}%";
        });
      },
      completed: (path) {
        Get.back();
        widget.completed.call(path);
      },
      error: (msg) {
        Get.back();
        errorDialog(context, content: msg);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    downloading();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: 200,
          height: 160,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                    "正在下载<${widget.url.substring(widget.url.lastIndexOf("/") + 1)}>..."),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.blue.shade200,
                          color: Colors.greenAccent,
                          value: _progress,
                        )),
                    const SizedBox(width: 10),
                    Text(_text),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      cancelToken.cancel();
                      Get.back();
                    },
                    child: const Text("取消")),
              ],
            ),
          ),
        ));
  }
}

///修改密码弹窗
void changePasswordDialog(BuildContext context) {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('change_password_dialog_title'.tr),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: oldPassword,
              style: const TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                hintText: 'change_password_dialog_old_password'.tr,
                hintStyle: const TextStyle(color: Colors.grey),
                counterStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    oldPassword.clear();
                  },
                ),
              ),
              maxLength: 10,
            ),
            TextField(
              controller: newPassword,
              style: const TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                hintText: 'change_password_dialog_new_password'.tr,
                hintStyle: const TextStyle(color: Colors.grey),
                counterStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    newPassword.clear();
                  },
                ),
              ),
              maxLength: 10,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('dialog_default_cancel'.tr),
        ),
        TextButton(
          onPressed: () {
            if (oldPassword.text.isEmpty) {
              errorDialog(context,
                  content: 'change_password_dialog_old_password'.tr);
              return;
            }
            if(md5Encode(oldPassword.text).toUpperCase()!=userController.user.value!.passWord){
              errorDialog(context,
                  content: 'change_password_dialog_old_password_error'.tr);
              return;
            }
            if (newPassword.text.isEmpty) {
              errorDialog(context,
                  content: 'change_password_dialog_new_password'.tr);
              return;
            }
            changePassword(context, oldPassword.text, newPassword.text,
                back: (msg) {
              informationDialog(context, content: msg, back: () {
                Get.back();
              });
            });
          },
          child: Text('change_password_dialog_submit'.tr),
        ),
      ],
    ),
  );
}
