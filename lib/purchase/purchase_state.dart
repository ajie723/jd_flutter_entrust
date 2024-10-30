import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/bean/http/response/purchase_list_info.dart';
import 'package:jd_flutter_for_entrust/purchase/purchase_detail.dart';
import '../bean/http/response/purchase_detail_list_info.dart';
import '../utils/utils.dart';
import '../utils/web_api.dart';
import 'dart:math';

class PurchaseOrderState {
  TextEditingController labelController = TextEditingController();
  var currentPage = 0.obs;

  var list = <String>['1', '2', '3', '4,', '5'];

  var saleOrder = ""; //销售订单号
  var voucherOrder = ""; //采购凭证号

  var typeSelect = spGet('purchase/selectType') ?? false; //混码
  var maxLabel = false.obs;

  var allSelect = true.obs; //全选
  var noSelect = true.obs; //取消全选
  var create = true.obs; //创建

  Map<String, List<List<String>>> tableData = {};

  var searchInfo = PurchaseListInfo(); //用来搜索的数据

  Map<String, List<List<String>>> sizeMap = {};

  RxList<PurchaseListInfo> dataList = <PurchaseListInfo>[].obs;
  RxList<PurchaseListInfo> showDataList = <PurchaseListInfo>[].obs;

  var detail = PurchaseDetailListInfo();
  var detailDataList = <OrderSizeInfos>[].obs;
  RxList<LabelInfos> labelDataList = <LabelInfos>[].obs;

  selectShowDataList(String search) {
    var list = <PurchaseListInfo>[];
    list.clear();

    if (search.isEmpty) {
      for (var i = 0; i < dataList.length; ++i) {
        list.add(dataList[i]);
      }
    } else {
      for (var i = 0; i < dataList.length; ++i) {
        if (dataList[i].SaleOrderNo!.contains(search)) {
          list.add(dataList[i]);
        }
      }
    }

    showDataList.value = list;
  }

  //搜索采购订单列表
  searchSaleOrderList({
    String? startDate,
    String? endDate,
    required Function(String msg) error,
  }) {
    httpGet(
      loading: 'purchase_get_sale_order'.tr,
      method: webApiGetSupplyPurchaseOrders,
      params: {
        'SupplyID': getUserInfo()!.fSupplierID,
        'SaleOrderNo': saleOrder,
        'POOrderNo': voucherOrder,
        'StartDate': startDate,
        'EndDate': endDate,
      },
    ).then((response) {
      if (response.resultCode == resultSuccess) {
        dataList.value = [
          for (var item in response.data) PurchaseListInfo.fromJson(item)
        ];

        var list = <PurchaseListInfo>[];
        list.clear();

        for (int i = 0; i < dataList.length; i++) {
          list.add(dataList[i]);
        }

        showDataList.value = list;

        Get.back();
      } else {
        showDataList.value = [];
        dataList.value = [];
        error.call(response.message ?? 'query_default_error'.tr);
      }
    });
  }

  //搜索采购订单详情
  searchSaleOrderDetail({
    PurchaseListInfo? info,
    required Function(String msg) error,
  }) {
    httpGet(
      loading: '正在获取采购订单详情...',
      method: webApiGetSupplyPurchaseOrderInfo,
      params: {
        'POOrderInterID': info!.POOrderInterID.toString(),
        'SaleOrderInterID': info.SaleOrderInterID.toString(),
      },
    ).then((response) {
      if (response.resultCode == resultSuccess) {
        detail = PurchaseDetailListInfo.fromJson(response.data);

        var list = <OrderSizeInfos>[];
        var list2 = <LabelInfos>[];
        list.clear();

        for (var i = 0; i < detail.orderSizeInfos!.length; ++i) {
          list.add(detail.orderSizeInfos![i]);
        }
        for (var i = 0; i < detail.labelInfos!.length; ++i) {
          list2.add(detail.labelInfos![i]);
        }
        detailDataList.value = list;
        labelDataList.value = list2;
        Get.to(() => PurchaseDetailPage());
      } else {
        detailDataList.value = [];
        labelDataList.value = [];
        error.call(response.message ?? 'query_default_error'.tr);
      }
    });
  }

  //创建贴标
  generatePackingLabelCode({
    String? labelQty,
    required Function(String msg) success,
    required Function(String msg) error,
  }) {

    var number = 0;   //选中
    var noBoxZero = true;

    for (var i = 0; i < detailDataList.length; ++i) {
      if(detailDataList[i].select.value == true){
        number++;
        if(detailDataList[i].boxSize==0){
          noBoxZero = false;
        }
      }
    }

    if(number>0 && noBoxZero==true){
      httpPost(
          loading: '正在创建贴标...',
          method: webApiGeneratePackingLabelCode,
          body: {
            //混码标
            'PoOrderInterID': detail.POOrderInterID,
            'SaleOrderInterID': detail.SaleOrderInterID,
            'UserID': getUserInfo()!.userID.toString(),
            'LabelType': typeSelect ? "2" : "1",
            'IsGenerateMaxLabelCount': maxLabel.value,
            'LabelCount': maxLabel.value? "1" : labelController.text,
            'SizeList': [
              for (var i = 0; i < detailDataList.length; ++i)
                if (detailDataList[i].select.value == true &&
                    detailDataList[i].boxSize! > 0)
                  {
                    'Size': detailDataList[i].Size,
                    'Capacity': detailDataList[i].boxSize,
                    'NoGenerateQty': detailDataList[i].LabelNotGenerateQty,
                  }
            ],
          }
      ).then((response) {
        if (response.resultCode == resultSuccess) {
          success.call(response.message ?? "创建成功");
        } else {
          error.call(response.message ?? 'query_default_error'.tr);
        }
      });
    }else{
      error.call('未选择尺码，或箱容为0');
    }
  }

  //全选与反选
  selectClick(bool select) {
    for (var i = 0; i < detailDataList.length; ++i) {
      detailDataList[i].select.value = select;
    }
    detailDataList.refresh();
  }

  //设置箱容
  setSizeBox({
    String? number,
    required Function(String msg) error,
  }) {
    logger.f('设置多少箱容：$number');

    var hasSelect = 0;

    for (var i = 0; i < detailDataList.length; ++i) {
      if (true == detailDataList[i].select.value) {
        hasSelect += 1;
        detailDataList[i].boxSize = number.toIntTry();
      }
    }

    if (hasSelect == 0) {
      error.call('请选择一个尺码'.tr);
    } else {
      spSave('purchase/boxNumber', number!);
      detailDataList.refresh();
    }
  }

  //尺码选择
  selectSizePosition(int position) {
    for (var i = 0; i < detailDataList.length; ++i) {
      if (i == position) {
        detailDataList[i].select.value = !detailDataList[i].select.value;
      }
    }
    detailDataList.refresh();
    logger.f(detailDataList[position].select.toString());
  }

  //贴标选择
  selectLabelPosition(int position) {
    for (var i = 0; i < labelDataList.length; ++i) {
      if (i == position) {
        labelDataList[i].labelSelect.value =
            !labelDataList[i].labelSelect.value;
      }
    }
    labelDataList.refresh();
  }

  //删除贴标
  poDelBarcode({
    required Function(String msg) success,
    required Function(String msg) error,
  }) {
    var number = 0;
    for (var i = 0; i < labelDataList.length; ++i) {
      if (labelDataList[i].labelSelect.value) {
        number += 1;
      }
    }
    if (number == 0) {
      error.call('请最少选择一个指令');
    } else {
      httpPost(
        loading: '正在删除贴标...',
        method: webApiGetPoDelBarcode,
        body: {
          'PackageInterID': labelDataList[0].PackageInterID,
          'Barcodes': [
            for (var i = 0; i < labelDataList.length; ++i)
              if (labelDataList[i].labelSelect.value == true)
                labelDataList[i].CardNo
          ],
        },
      ).then((response) {
        if (response.resultCode == resultSuccess) {
          success.call(response.message ?? '删除成功');
        } else {
          error.call(response.message ?? 'query_default_error'.tr);
        }
      });
    }
  }

  //贴标的全选和反旋
  selectLabel(bool isAll) {
    for (var i = 0; i < labelDataList.length; ++i) {
      labelDataList[i].labelSelect.value = isAll;
    }
    labelDataList.refresh();
  }

  //判断是否选择了贴标
  bool addDataToSizeMap() {
    tableData.clear();
    var number = 0;

    for (int i = 0; i < labelDataList.length; i++) {
      if (labelDataList[i].labelSelect.value == true) {
        number++;
      }
    }
    logger.f(tableData);

    if (number == 0) {
      return false;
    } else {
      return true;
    }
  }

  //设置打标标识
  setPrintLabelFlag({
    required Function(String msg) success,
    required Function(String msg) error,
  }) {
    httpPost(
      loading: '正在设置打印标识...',
      method: webApiSetPrintLabelFlag,
      body: {
        'InterID': labelDataList[0].PackageInterID,
        'Barcodes': [
          for (var i = 0; i < labelDataList.length; ++i)
            if (labelDataList[i].labelSelect.value == true)
              labelDataList[i].CardNo
        ],
      },
    ).then((response) {
      if (response.resultCode == resultSuccess) {
        success.call(response.message ?? '设置成功');
      } else {
        error.call(response.message ?? 'query_default_error'.tr);
      }
    });
  }

  //贴标数量的加或者减
  addOrRemoveLabelNumber({
    bool? isAdd,
    required Function(String msg) error,
  }) {
    var selectNumber = 0;

    for (var i = 0; i < detailDataList.length; ++i) {
      if (detailDataList[i].select.value == true) {
        selectNumber++;
      }
    }

    if (selectNumber > 0) {
      var numberList = <int>[];

      for (var i = 0; i < detailDataList.length; ++i) {
        if (detailDataList[i].select.value == true) {
          numberList.add(detailDataList[i].labelNumber().ceil());
        }
      }

      var minNumber = numberList.reduce(min);

      log('打印最小可生成：$minNumber');

      if (isAdd!) {
        labelController.text =
            (labelController.text.toString().toIntTry() + 1).toString();
        if (labelController.text.toIntTry() > minNumber) {
          labelController.text = minNumber.toString();
        }
      } else {
        if (labelController.text.toString().toIntTry() - 1 <= 1) {
          labelController.text = "";
        } else {
          labelController.text =
              (labelController.text.toString().toIntTry() - 1).toString();
        }
      }
    } else {
      error.call('请最少选择一个尺码');
    }
  }

  setMaxLabel(bool isMax) {
    if (isMax) {
      var selectNumber = 0;

      for (var i = 0; i < detailDataList.length; ++i) {
        if (detailDataList[i].select.value == true) {
          selectNumber++;
        }
      }

      if (selectNumber > 0) {
        var numberList = <int>[];

        for (var i = 0; i < detailDataList.length; ++i) {
          if (detailDataList[i].select.value == true) {
            numberList.add(detailDataList[i].labelNumber().ceil());
          }
        }
        var minNumber = numberList.reduce(min);


        labelController.text = minNumber.toString();
      }
    }
  }
}
