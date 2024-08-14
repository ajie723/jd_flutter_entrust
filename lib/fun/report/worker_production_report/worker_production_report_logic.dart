import 'package:get/get.dart';

import '../../../route.dart';
import '../../../widget/dialogs.dart';
import '../../../widget/picker/picker_controller.dart';
import 'worker_production_report_state.dart';

class WorkerProductionReportLogic extends GetxController {
  final WorkerProductionReportState state = WorkerProductionReportState();

  ///部门选择器的控制器
  var pickerControllerDepartment = OptionsPickerController(
    PickerType.mesDepartment,
    saveKey:
        '${RouteConfig.workerProductionReport.name}${PickerType.mesDepartment}',
  );

  ///日期选择器的控制器
  late DatePickerController pickerControllerDate = DatePickerController(
    PickerType.date,
    saveKey: '${RouteConfig.workerProductionReport.name}${PickerType.date}',
  );

  query() {
    state.getWorkerProductionReport(
      departmentID: pickerControllerDepartment.selectedId.value,
      date: pickerControllerDate.getDateFormatYMD(),
      success: () => Get.back(),
      error: (msg) => errorDialog(content: msg),
    );
  }
}
