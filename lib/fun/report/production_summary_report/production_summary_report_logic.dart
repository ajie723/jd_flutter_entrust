import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jd_flutter/route.dart';

import '../../../http/response/production_summary_info.dart';
import '../../../http/web_api.dart';
import '../../../widget/dialogs.dart';
import '../../../widget/picker/picker_controller.dart';
import 'production_summary_report_state.dart';

class ProductionSummaryReportLogic extends GetxController {
  final ProductionSummaryReportState state = ProductionSummaryReportState();

  ///日期选择器的控制器
  var pickerControllerDate = DatePickerController(
    PickerType.date,
    saveKey: '${RouteConfig.productionSummaryTable.name}${PickerType.date}',
  );
  var spinnerControllerWorkShop = SpinnerController(
    saveKey: RouteConfig.productionSummaryTable.name,
    dataList: [
      'spinner_work_shop_hint1'.tr,
      'spinner_work_shop_hint2'.tr,
      'spinner_work_shop_hint3'.tr,
      'spinner_work_shop_hint4'.tr,
      'spinner_work_shop_hint5'.tr
    ],
  );

  ///获取产量汇总表接口
  query() {
    httpGet(
      loading: 'production_summary_report_querying'.tr,
      method: webApiGetPrdShopDayReport,
      query: {
        'ExecTodayDateTime': pickerControllerDate.getDateFormatYMD(),
        'ExecWhere':
            'where t.FWorkShopID = ${spinnerControllerWorkShop.selectIndex + 1}',
      },
    ).then((response) {
      if (response.resultCode == resultSuccess) {
        try {
          state.tableData.clear();
          var list = <DataRow>[];
          var index = 0;
          for (var item in jsonDecode(response.data)) {
            var data = ProductionSummaryInfo.fromJson(item);
            state.tableData.add(data);
            list.add(state.createDataRow(data,
                index.isEven ? Colors.transparent : Colors.grey.shade100));
            index++;
          }
          state.tableDataRows.value = list;
          Get.back();
        } on Error catch (e) {
          logger.e(e);
          errorDialog(content: 'json_format_error'.tr);
        }
      } else {
        errorDialog(content: response.message ?? 'query_default_error'.tr);
      }
    });
  }
}
