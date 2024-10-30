import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/purchase/purchase_state.dart';

import '../widget/picker/picker_controller.dart';

class PurchaseLogic extends GetxController{
  final PurchaseOrderState state = PurchaseOrderState();

  ///日期选择器的控制器
  var pickerControllerStartDate = DatePickerController(
    PickerType.startDate,
    saveKey: '${'purchase'}StartDate',
  );

  ///日期选择器的控制器
  var pickerControllerEndDate = DatePickerController(
    PickerType.endDate,
    saveKey: '${'purchase'}EndDate',
  );


}