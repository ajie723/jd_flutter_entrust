import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:jd_flutter_for_entrust/bean/http/response/label_report_list_info.dart';
import 'package:jd_flutter_for_entrust/bean/http/response/scan_label_infos.dart';
import 'package:jd_flutter_for_entrust/utils/web_api.dart';
import 'package:jd_flutter_for_entrust/widget/dialogs.dart';
import 'package:jd_flutter_for_entrust/utils/utils.dart';

class LabelReportState {
  var headIndex = 0; //2级列表头index

  var detail = LabelReportListInfo();

  RxList<LabelReportListInfo> showSubDataList = <LabelReportListInfo>[].obs;

  //是否包含此贴标
  bool haveLabel(String label) {
    var number = 0;

    showSubDataList.forEach((item) async {
      for (int i = 0; i < item.scanLabelInfos!.length; i++) {
        if (item.scanLabelInfos![i].cardNo == label) {
          number += 1;
        }
      }
    });

    if (number > 0) {
      return true;
    } else {
      return false;
    }
  }

  //本地移除
  removeShowData(int index) {
    showSubDataList.removeAt(index);
    showSubDataList.refresh();
  }

  //本次扫描
  addThisTimeQty(String label) {
    logger.f('走本次扫码');

    var number = 0;

    showSubDataList.forEach((item) async {
      for (int i = 0; i < item.scanLabelInfos!.length; i++) {
        if (item.scanLabelInfos![i].cardNo == label) {
          number += 1;
          if (item.scanLabelInfos![i].isAdd.value == false) {
            item.thisTimeScan =
                item.thisTimeScan.add(item.scanLabelInfos![i].labelQty!);
            item.scanLabelInfos![i].isAdd.value = true;
          }
        }
      }
    });

    if (number == 0) {
      errorDialog(content: '找不到该贴标');
      number = 0;
    }

    showSubDataList.refresh();
  }

  //获取采购订单
  getPurchaseOrderInfo4Report({
    String? code,
    required Function(String msg) error,
  }) {
    httpGet(
      loading: '正在获取采购订单...',
      method: webApiGetPurchaseOrderInfo4Report,
      params: {
        'barCode': code,
      },
    ).then((response) {
      if (response.resultCode == resultSuccess) {
        detail = LabelReportListInfo.fromJson(response.data);

        var isHave = false;

        for (int i = 0; i < showSubDataList.length; i++) {
          if (showSubDataList[i].pOOrderInterID == detail.pOOrderInterID) {
            isHave = true;
          }
        }

        if (!isHave) {
          showSubDataList.add(detail);
        }
      } else {
        error.call(response.message ?? 'query_default_error'.tr);
      }
    });
  }

  //提交采购订单条码
  purchaseOrderScanReport({
    required Function(String msg) success,
    required Function(String msg) error,
  }) {
    httpPost(
        loading: '正在提交条码...',
        method: webApiPurchaseOrderScanReport,
        body: [
          for (int i = 0; i < showSubDataList.length; i++)
            {
              'POOrderInterID': showSubDataList[i].pOOrderInterID,
              'SaleOrderInterID': showSubDataList[i].saleOrderInterID,
              'CardNos': [
                for (ScanLabelInfos data in showSubDataList[i].scanLabelInfos?.where((v)=>v.isAdd.value)??[])
                  data.cardNo
              ],
            }
        ]).then((response) {
      if (response.resultCode == resultSuccess) {
        success.call(response.message ?? '提交成功'.tr);
      } else {
        error.call(response.message ?? 'query_default_error'.tr);
      }
    });
  }

  clearListData(){
    showSubDataList.value=[];
  }
}
