import 'package:get/get.dart';
import '../../../bean/http/response/molding_pack_area_report_info.dart';
import '../../../web_api.dart';

class MoldingPackAreaReportPageState {
  var etInstruction = '';
  var etOrderNumber = '';
  var etTypeBody = '';

  var tableData = <MoldingPackAreaReportInfo>[].obs;


  var line = ''.obs;
  var typeBody = ''.obs;
  var color = ''.obs;
  var detailTableData = <MoldingPackAreaReportDetailInfo>[].obs;


  getMoldingPackAreaReport({
    required String startDate,
    required String endDate,
    required List<String> packAreaIDs,
    required Function() success,
    required Function(String msg) error,
  }) {
    httpGet(
        method: webApiGetMoldingPackAreaReport,
        loading: '正在查询区域报表...',
        params: {
          'startDate': startDate,
          'endDate': endDate,
          'factoryType': etTypeBody,
          'billNO': etInstruction,
          'clientOrderNumber': etOrderNumber,
          'packAreaIDs': packAreaIDs,
        }).then((response) {
      if (response.resultCode == resultSuccess) {
        tableData.value = [
          for (var json in response.data)
            MoldingPackAreaReportInfo.fromJson(json)
        ];
        success.call();
      } else {
        error.call(response.message ?? 'query_default_error'.tr);
      }
    });
  }

  getMoldingPackAreaReportDetail({
    required int interID,
    required String clientOrderNumber,
    required Function() success,
    required Function(String msg) error,
  }) {
    httpGet(
        method: webApiGetMoldingPackAreaReportDetail,
        loading: '正在获取报表明细...',
        params: {
          'interID': interID,
          'clientOrderNumber': clientOrderNumber,
        }).then((response) {
      if (response.resultCode == resultSuccess) {
        detailTableData.value = [
          for (var json in response.data)
            MoldingPackAreaReportDetailInfo.fromJson(json)
        ];
        success.call();
      } else {
        error.call(response.message ?? 'query_default_error'.tr);
      }
    });
  }




}
