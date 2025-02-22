import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/widget/dialogs.dart';

import '../../../utils/web_api.dart';

class ViewInstructionDetailsState {
  var tetInstruction = '';

  getInstructionDetailsFile({
    required String processFlowID,
    required Function(Uri uri) success,
    required Function(String msg) error,
  }) {
    httpGet(
      loading: 'view_instruction_details_querying'.tr,
      method: webApiGetInstructionDetailsFile,
      params: {
        'MoNo': tetInstruction,
        'ProcessFlowID': processFlowID,
      },
    ).then((response) {
      if (response.resultCode == resultSuccess) {
        success.call(Uri.parse(response.data));
      } else {
        errorDialog(content: response.message ?? 'query_default_error'.tr);
      }
    });
  }
}
