import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../route.dart';
import '../../../utils.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/picker/picker_view.dart';
import 'view_instruction_details_logic.dart';

class ViewInstructionDetailsPage extends StatefulWidget {
  const ViewInstructionDetailsPage({Key? key}) : super(key: key);

  @override
  State<ViewInstructionDetailsPage> createState() =>
      _ViewInstructionDetailsPageState();
}

class _ViewInstructionDetailsPageState
    extends State<ViewInstructionDetailsPage> {
  final logic = Get.put(ViewInstructionDetailsLogic());

  @override
  Widget build(BuildContext context) {
    return titleWithDrawer(
      title: getFunctionTitle(),
      children: [
        EditText(hint: '请输入指令单号', controller: logic.textControllerInstruction),
        OptionsPicker(pickerController: logic.pickerControllerProcessFlow),
      ],
      query: () => logic.queryPDF(),
      body: GetPlatform.isAndroid || GetPlatform.isIOS
          ? WebViewWidget(controller: logic.webViewController)
          : null,
    );
  }

  @override
  void dispose() {
    Get.delete<ViewInstructionDetailsLogic>();
    super.dispose();
  }
}
