import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jd_flutter/widget/picker/picker_controller.dart';

import '../../../http/response/molding_pack_area_report_info.dart';
import '../../../http/web_api.dart';
import '../../../route.dart';
import '../../../widget/dialogs.dart';
import 'molding_pack_area_report_state.dart';

class MoldingPackAreaReportPageLogic extends GetxController {
  final MoldingPackAreaReportPageState state = MoldingPackAreaReportPageState();

  var textControllerInstruction = TextEditingController();
  var textControllerOrderNumber = TextEditingController();
  var textControllerTypeBody = TextEditingController();

  late DatePickerController dateControllerStart;
  late DatePickerController dateControllerEnd;
  var checkBoxController = CheckBoxController(
    PickerType.mesMoldingPackAreaReportType,
    saveKey:
        '${RouteConfig.moldingPackAreaReport.name}${PickerType.mesMoldingPackAreaReportType}',
  );

  @override
  void onInit() {
    var today = DateTime.now();
    var start = DateTime(today.year, today.month - 2, today.day);
    dateControllerStart = DatePickerController(
      PickerType.startDate,
      saveKey:
          '${RouteConfig.moldingPackAreaReport.name}${PickerType.startDate}',
      firstDate: start,
      lastDate: today,
    );
    dateControllerEnd = DatePickerController(
      PickerType.endDate,
      saveKey: '${RouteConfig.moldingPackAreaReport.name}${PickerType.endDate}',
      firstDate: start,
      lastDate: today,
    );
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   refreshList();
  // }

  // string startDate,
  // string endDate,
  // string factoryType,
  // string billNO,
  // string clientOrderNumber,
  // List<string> packAreaIDs

  query() {
    httpGet(
        method: webApiGetMoldingPackAreaReport,
        loading: '正在查询区域报表...',
        query: {
          'startDate': dateControllerStart.getDateFormatYMD(),
          'endDate': dateControllerEnd.getDateFormatYMD(),
          'factoryType': textControllerTypeBody.text,
          'billNO': textControllerInstruction.text,
          'clientOrderNumber': textControllerOrderNumber.text,
          'packAreaIDs': checkBoxController.selectedIds,
        }).then((response) {
      if (response.resultCode == resultSuccess) {
        var jsonList = jsonDecode(response.data);
        var list = <DataRow>[];
        for (var i = 0; i < jsonList.length; ++i) {
          list.add(
            state.createTableDataRow(
              MoldingPackAreaReportInfo.fromJson(jsonList[i]),
              i.isEven ? Colors.transparent : Colors.grey.shade100,
              (interID, clientOrderNumber) => getDetails,
            ),
          );
        }
        state.tableDataRows.value = list;
      } else {
        errorDialog(content: response.message);
      }
    });
  }

  // string MoID,
  // string clientOrderNumber
  getDetails(String interID, String clientOrderNumber) {
    httpGet(
        method: webApiGetMoldingPackAreaReportDetail,
        loading: '正在获取报表明细...',
        query: {
          'MoID': interID,
          'clientOrderNumber': clientOrderNumber,
        }).then((response) {
      if (response.resultCode == resultSuccess) {
        var list = <MoldingPackAreaReportDetailInfo>[];
        for (var item in jsonDecode(response.data)) {
          list.add(MoldingPackAreaReportDetailInfo.fromJson(item));
        }
      } else {
        errorDialog(content: response.message);
      }
    });
  }
}
