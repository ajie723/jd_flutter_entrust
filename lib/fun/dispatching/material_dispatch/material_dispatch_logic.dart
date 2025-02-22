import 'package:get/get.dart';

import '../../../bean/http/response/material_dispatch_info.dart';
import '../../../bean/http/response/process_specification_info.dart';
import '../../../route.dart';
import '../../../widget/dialogs.dart';
import '../../../widget/picker/picker_controller.dart';
import '../../../widget/spinner_widget.dart';
import '../../../widget/web_page.dart';
import 'material_dispatch_state.dart';

class MaterialDispatchLogic extends GetxController {
  final MaterialDispatchState state = MaterialDispatchState();
  var scReportState = SpinnerController(
    saveKey: RouteConfig.materialDispatchPage.name,
    dataList: [
      '全部',
      '未报工',
      '已报工',
      '已生成贴标未报工',
    ],
  );

  ///日期选择器的控制器
  var dpcStartDate = DatePickerController(
    PickerType.date,
    saveKey: '${RouteConfig.materialDispatchPage.name}StartDate',
  )..firstDate = DateTime(
      DateTime.now().year - 5, DateTime.now().month, DateTime.now().day);

  ///日期选择器的控制器
  var dpcEndDate = DatePickerController(
    PickerType.date,
    saveKey: '${RouteConfig.materialDispatchPage.name}EndDate',
  );

  // @override
  // void onReady() {
  //   userInfo?.empID = 175122;
  //   userInfo?.factory = '1000';
  //   userInfo?.defaultStockNumber = '1104';
  //   super.onReady();
  // }

  @override
  void onClose() {
    super.onClose();
  }

  query() {
    state.getScWorkCardProcess(
      startDate: dpcStartDate.getDateFormatYMD(),
      endDate: dpcEndDate.getDateFormatYMD(),
      status: scReportState.selectIndex - 1,
      success: () {
        if (state.orderList.isNotEmpty) Get.back();
      },
      error: (msg) => errorDialog(content: msg),
    );
  }

  refreshDataList({Function()? refresh}) {
    state.getScWorkCardProcess(
      startDate: dpcStartDate.getDateFormatYMD(),
      endDate: dpcEndDate.getDateFormatYMD(),
      status: scReportState.selectIndex - 1,
      success: () => refresh?.call(),
      error: (msg) => errorDialog(content: msg),
    );
  }

  search(String s) {
    if (s.isEmpty) {
      state.showOrderList.value = state.orderList;
    } else {
      state.showOrderList.value = state.orderList
          .where((v) => v.materialNumber?.contains(s) ?? false)
          .toList();
    }
  }

  reportToSAP() {
    state.reportToSAP(
      success: (msg) => successDialog(
        content: msg,
        back: () => refreshDataList(),
      ),
      error: (msg) => errorDialog(content: msg),
    );
  }

  batchWarehousing() {
    var submitList = state.createSubmitData();
    if (submitList.isEmpty) {
      informationDialog(content: '没有需要入库的数据');
    } else {
      state.batchWarehousing(
        submitList: submitList,
        success: (msg) => successDialog(
          content: msg,
          back: () => refreshDataList(),
        ),
        error: (msg) => errorDialog(content: msg),
      );
    }
  }

  queryProcessSpecification(
    String typeBody,
    Function(List<ProcessSpecificationInfo>) callback,
  ) {
    state.queryProcessSpecification(
      typeBody: typeBody,
      success: (list) {
        if (list.length == 1) {
          Get.to(WebPage(
            title: list[0].fileName ?? '',
            url: list[0].fullName ?? '',
          ));
        } else {
          callback.call(list);
        }
      },
      error: (msg) => errorDialog(content: msg),
    );
  }

  itemReport(MaterialDispatchInfo data) {
    state.itemReport(
      data: data,
      success: (msg) => successDialog(
        content: msg,
        back: () => refreshDataList(),
      ),
      error: (msg) => errorDialog(content: msg),
    );
  }

  itemCancelReport(MaterialDispatchInfo data) {
    state.itemCancelReport(
      data: data,
      success: (msg) => successDialog(
        content: msg,
        back: () => refreshDataList(),
      ),
      error: (msg) => errorDialog(content: msg),
    );
  }

  subItemWarehousing(Children data, String sapDecideArea) {
    state.subItemWarehousing(
      data: data,
      sapDecideArea: sapDecideArea,
      success: (msg) => successDialog(
        content: msg,
        back: () => refreshDataList(),
      ),
      error: (msg) => errorDialog(content: msg),
    );
  }

  subItemReport(
    MaterialDispatchInfo data,
    Children subData,
    bool isPrint,
  ) {
    state.subItemReport(
      data: data,
      subData: subData,
      success: (msg) => successDialog(
        content: msg,
        back: () => refreshDataList(refresh: () {
          if (isPrint) {
            // List<String> guidList = response.data['GuidList'];
            // List<String> pickUpCodeList = response.data['PickUpCodeList'];
          }
        }),
      ),
      error: (msg) => errorDialog(content: msg),
    );
  }

  subItemCancelReport(Children subData) {
    state.subItemCancelReport(
      subData: subData,
      success: (msg) => successDialog(
        content: msg,
        back: () => refreshDataList(),
      ),
      error: (msg) => errorDialog(content: msg),
    );
  }

}
