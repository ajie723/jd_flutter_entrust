import 'dart:convert';

import 'package:get/get.dart';

import '../../http/response/picker_item.dart';
import '../../http/web_api.dart';
import '../../utils.dart';

enum PickerType {
  sapSupplier,
  sapCompany,
  sapFactory,
  sapWorkCenter,
  sapDepartment,
  sapProcessFlow,
  sapMachine,
  sapWorkCenterNew,
  sapGroup,
  sapFactoryWarehouse,
  mesWorkShop,
  mesDepartment,
  mesOrganization,
  mesProcessFlow,
  mesProductionReportType,
  date,
  startDate,
  endDate,
}

abstract class PickerController {
  late PickerType pickerType;

  PickerController(this.pickerType);

  String getButtonName() {
    switch (pickerType) {
      case PickerType.sapSupplier:
        return 'picker_type_sap_supplier'.tr;
      case PickerType.sapCompany:
        return 'picker_type_sap_company'.tr;
      case PickerType.sapFactory:
        return 'picker_type_sap_factory'.tr;
      case PickerType.sapWorkCenter:
        return 'picker_type_sap_work_center'.tr;
      case PickerType.sapDepartment:
        return 'picker_type_sap_department'.tr;
      case PickerType.sapProcessFlow:
        return 'picker_type_sap_process_flow'.tr;
      case PickerType.sapMachine:
        return 'picker_type_sap_machine'.tr;
      case PickerType.sapWorkCenterNew:
        return 'picker_type_sap_work_center_new'.tr;
      case PickerType.sapGroup:
        return 'picker_type_sap_group'.tr;
      case PickerType.sapFactoryWarehouse:
        return 'picker_type_sap_factory_warehouse'.tr;
      case PickerType.mesWorkShop:
        return 'picker_type_mes_work_shop'.tr;
      case PickerType.mesDepartment:
        return 'picker_type_mes_department'.tr;
      case PickerType.mesOrganization:
        return 'picker_type_mes_organization'.tr;
      case PickerType.mesProcessFlow:
        return 'picker_type_mes_process_flow'.tr;
      case PickerType.mesProductionReportType:
        return 'picker_type_mes_production_report_type'.tr;
      case PickerType.date:
        return 'picker_type_date'.tr;
      case PickerType.startDate:
        return 'picker_type_start_date'.tr;
      case PickerType.endDate:
        return 'picker_type_end_date'.tr;
      default:
        return 'Picker';
    }
  }

  Function getDataList() {
    switch (pickerType) {
      case PickerType.sapSupplier:
        return getSapSupplier;
      case PickerType.sapCompany:
        return getSapCompany;
      case PickerType.sapFactory:
        return getSapFactory;
      case PickerType.sapWorkCenter:
        return getSapWorkCenter;
      case PickerType.sapDepartment:
        return getSapDepartment;
      case PickerType.sapProcessFlow:
        return getSapProcessFlow;
      case PickerType.sapMachine:
        return getSapMachine;
      case PickerType.sapWorkCenterNew:
        return getSapWorkCenterNew;
      case PickerType.sapGroup:
        return getSapGroup;
      case PickerType.sapFactoryWarehouse:
        return getSapFactoryAndWarehouse;
      case PickerType.mesWorkShop:
        return getMesWorkShop;
      case PickerType.mesDepartment:
        return getMesDepartment;
      case PickerType.mesOrganization:
        return getMesOrganization;
      case PickerType.mesProcessFlow:
        return getMesProcessFlow;
      case PickerType.mesProductionReportType:
        return getMesProductionReportType;
      default:
        return getDataListError;
    }
  }
}

class OptionsPickerController extends PickerController {
  var selectedName = ''.obs;
  var selectedId = ''.obs;
  var loadingError = ''.obs;
  var enable = true.obs;
  final String? saveKey;
  final String? buttonName;
  final Function? dataList;
  List<PickerItem> pickerData = [];
  RxList<PickerItem> pickerItems = <PickerItem>[].obs;
  var selectItem = 0;
  final Function(int)? onChanged;
  final Function(int)? onSelected;

  OptionsPickerController(
    super.pickerType, {
    this.saveKey,
    this.buttonName,
    this.dataList,
    this.onChanged,
    this.onSelected,
  });

  select(int item) {
    selectedName.value = pickerItems[item].pickerName();
    selectedId.value = pickerItems[item].pickerId();
    selectItem = pickerData.indexWhere((v) => v.pickerId() == selectedId.value);
    if (saveKey != null && saveKey!.isNotEmpty) {
      spSave(saveKey!, pickerItems[item].pickerId());
    }
    onSelected?.call(selectItem);
    onChanged?.call(selectItem);
  }

  search(String text) {
    if (text.trim().isEmpty) {
      pickerItems.value = pickerData;
    } else {
      pickerItems.value = pickerData
          .where(
            (v) => v.pickerName().toUpperCase().contains(text.toUpperCase()),
          )
          .toList();
    }
  }

  int getSave() {
    var select = selectItem;
    if (saveKey != null && saveKey!.isNotEmpty) {
      var save = spGet(saveKey!);
      if (save != null && save.isNotEmpty) {
        var find1 =
            pickerItems.indexWhere((element) => element.pickerId() == save);
        if (find1 >= 0) {
          select = find1;
        }
      }
    }
    return select;
  }

  getData() {
    if (pickerItems.isEmpty) {
      loadingError.value = 'picker_loading'.tr;
      Function fun = dataList ?? getDataList();
      fun().then((value) {
        if (value is List<PickerItem>) {
          loadingError.value = '';
          pickerData = value;
          pickerItems.value = value;
          if (value.length > 1) {
            var save = 0;
            if (saveKey != null && saveKey!.isNotEmpty) {
              save = getSave();
            }
            selectedName.value = pickerItems[save].pickerName();
            selectedId.value = pickerItems[save].pickerId();
            selectItem = save;
            onSelected?.call(selectItem);
          }
        } else {
          loadingError.value = value as String;
        }
      });
    }
  }
}

class LinkOptionsPickerController extends PickerController {
  var selectedName = ''.obs;
  var selectedId = ''.obs;
  var loadingError = ''.obs;
  var enable = true.obs;
  List<LinkPickerItem> pickerData = [];
  RxList<PickerItem> pickerItems1 = <PickerItem>[].obs;
  RxList<PickerItem> pickerItems2 = <PickerItem>[].obs;
  String searchText = '';
  var selectItem1 = 0;
  var selectItem2 = 0;

  final String? saveKey;
  final String? buttonName;
  final Function? dataList;
  final Function(int, int)? onChanged;
  final Function(int, int)? onSelected;

  LinkOptionsPickerController(
    super.pickerType, {
    this.saveKey,
    this.buttonName,
    this.dataList,
    this.onChanged,
    this.onSelected,
  });

  select(int item1, int item2) {
    if (pickerItems1.isEmpty) return;
    var pick1 = pickerItems1[item1];
    var pick2 = pickerItems2[item2];
    selectedName.value = '${pick1.pickerName()}-${pick2.pickerName()}';
    selectedId.value = pickerItems2[item2].pickerId();
    selectItem1 =
        pickerData.indexWhere((v) => v.pickerId() == pick1.pickerId());
    selectItem2 = pickerData[selectItem1]
        .subList()
        .indexWhere((v) => v.pickerId() == pick2.pickerId());
    if (saveKey != null && saveKey!.isNotEmpty) {
      spSave(saveKey!, '${pick1.pickerId()}@@@${pick2.pickerId()}');
    }
    onSelected?.call(selectItem1, selectItem2);
    onChanged?.call(selectItem1, selectItem2);
  }

  refreshItem2(int index) {
    if (searchText.isNotEmpty) {
      pickerItems2.value = (pickerItems1[index] as LinkPickerItem)
          .subList()
          .where((element) => element
              .pickerName()
              .toUpperCase()
              .contains(searchText.toUpperCase()))
          .toList();
    } else {
      pickerItems2.value = (pickerItems1[index] as LinkPickerItem).subList();
    }
  }

  List<int> getSave() {
    var select1 = selectItem1;
    var select2 = selectItem2;
    if (saveKey != null && saveKey!.isNotEmpty) {
      String? key = spGet(saveKey!);
      if (key != null && key.contains('@@@')) {
        var save = key.split('@@@');
        if (save.length == 2) {
          var find1 =
              pickerData.indexWhere((element) => element.pickerId() == save[0]);
          if (find1 >= 0) {
            select1 = find1;
            var list = pickerData[find1].subList();
            if (list.isNotEmpty) {
              var find2 =
                  list.indexWhere((element) => element.pickerId() == save[1]);
              if (find2 >= 0) {
                select2 = find2;
              }
            }
          }
        }
      }
    }
    return [select1, select2];
  }

  getData() {
    if (pickerItems1.isEmpty && pickerItems2.isEmpty) {
      loadingError.value = 'picker_loading'.tr;
      Function fun = dataList ?? getDataList();
      fun().then((value) {
        if (value is List<LinkPickerItem>) {
          loadingError.value = '';
          pickerData = value;
          pickerItems1.value = pickerData;
          if (pickerData.length > 1) {
            var save = getSave();
            selectItem1 = save[0];
            selectItem2 = save[1];
            var pick1 = pickerItems1[selectItem1];
            pickerItems2.value = pickerData[selectItem1].subList();
            var pick2 = pickerItems2[selectItem2];
            selectedName.value = '${pick1.pickerName()}-${pick2.pickerName()}';
            selectedId.value = pick2.pickerId();
            onSelected?.call(selectItem1, selectItem2);
          }
        } else {
          loadingError.value = value as String;
        }
      });
    }
  }

  search(String text) {
    searchText = text;
    if (text.trim().isEmpty && pickerData.isNotEmpty) {
      pickerItems1.value = pickerData;
      pickerItems2.value = pickerData[selectItem1].subList();
    } else {
      pickerItems1.value = pickerData
          .where(
            (v1) => v1.subList().any((v2) =>
                v2.pickerName().toUpperCase().contains(text.toUpperCase())),
          )
          .toList();
      if (pickerItems1.isNotEmpty) {
        pickerItems2.value = (pickerItems1[0] as LinkPickerItem).subList();
      } else {
        pickerItems2.value = [];
      }
    }
  }
}

class DatePickerController extends PickerController {
  Rx<DateTime> pickDate = DateTime.now().obs;
  var enable = true.obs;
  final String? saveKey;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? buttonName;
  final Function(DateTime)? onChanged;
  final Function(DateTime)? onSelected;

  DatePickerController(
    super.pickerType, {
    this.saveKey,
    this.firstDate,
    this.lastDate,
    this.buttonName,
    this.onChanged,
    this.onSelected,
  }) {
    pickDate.value = getSave();
    onSelected?.call(pickDate.value);
  }

  select(DateTime date) {
    pickDate.value = date;
    if (saveKey != null && saveKey!.isNotEmpty) {
      spSave(saveKey!, date.millisecondsSinceEpoch);
    }
    onSelected?.call(date);
    onChanged?.call(date);
  }

  DateTime getSave() {
    DateTime time = pickDate.value;
    if (saveKey != null && saveKey!.isNotEmpty) {
      int? save = spGet(saveKey!);
      if (save != null) {
        time = DateTime.fromMillisecondsSinceEpoch(save);
      }
    }
    return time;
  }

  String getDateFormatYMD() {
    return '${pickDate.value.year}-${pickDate.value.month}-${pickDate.value.day}';
  }
}

class SpinnerController {
  var select = ''.obs;
  var selectIndex = 0;
  String? saveKey;
  var dataList = <String>[];
  final Function(int)? onChanged;
  final Function(int)? onSelected;

  SpinnerController({
    this.saveKey,
    required this.dataList,
    this.onChanged,
    this.onSelected,
  }) {
    selectIndex = getSave();
    select.value = dataList[selectIndex];
    onSelected?.call(selectIndex);
  }

  int getSave() {
    var select = selectIndex;
    if (saveKey != null && saveKey!.isNotEmpty) {
      var save = spGet(saveKey!);
      if (save != null && save.isNotEmpty) {
        var index = dataList.indexOf(save);
        if (index != -1) select = index;
      }
    }
    return select;
  }

  changeSelected(String? value) {
    if (value != null && value.isNotEmpty) {
      select.value = value;
      var index = dataList.indexOf(value);
      if (index != -1) {
        selectIndex = index;
        spSave(saveKey!, value);
      }
      onChanged?.call(selectIndex);
    }
  }
}

Future getDataListError() async {
  return 'picker_type_error'.tr;
}

///获取Sap供应商列表
Future getSapSupplier() async {
  var response = await httpGet(method: webApiPickerSapSupplier);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapSupplier.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap公司列表
Future getSapCompany() async {
  var response = await httpGet(method: webApiPickerSapCompany);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapCompany.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap厂区列表
Future getSapFactory() async {
  var response = await httpGet(method: webApiPickerSapFactory);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapFactory.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap工作中心列表
Future getSapWorkCenter() async {
  var response = await httpGet(method: webApiPickerSapWorkCenter);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapWorkCenter.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap部门列表
Future getSapDepartment() async {
  var response = await httpGet(method: webApiPickerSapDepartment);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapDepartment.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Mes车间列表
Future getMesWorkShop() async {
  var response = await httpGet(method: webApiPickerMesWorkShop);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerMesWorkShop.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Mes部门列表
Future getMesDepartment() async {
  var response = await httpGet(
    method: webApiPickerMesDepartment,
    query: {'OrganizeID': userController.user.value!.organizeID ?? -1},
  );
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerMesDepartment.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Mes组织列表
Future getMesOrganization() async {
  var response = await httpGet(method: webApiPickerMesOrganization);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerMesOrganization.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap制程列表
Future getSapProcessFlow() async {
  var response = await httpGet(method: webApiPickerSapProcessFlow);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapProcessFlow.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Mes制程列表
Future getMesProcessFlow() async {
  var response = await httpGet(method: webApiPickerMesProcessFlow);
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerMesProcessFlow.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Mes生产计件报表类型
Future getMesProductionReportType() async {
  var response = await httpGet(
    method: webApiGetProductionReportType,
    query: {'SearchType': 'app'},
  );
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerMesProductionReportType.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap机台列表
Future getSapMachine() async {
  var response = await httpGet(
    method: webApiPickerSapMachine,
    query: {'EmpID': userController.user.value?.empID ?? 0},
  );
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapMachine.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap工作中心(新)列表
Future getSapWorkCenterNew() async {
  var response = await httpGet(
    method: webApiPickerSapWorkCenterNew,
    query: {
      'ShowType': 10,
      'UserID': userController.user.value?.userID ?? 0,
    },
  );
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapWorkCenterNew.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap组别列表
Future getSapGroup() async {
  var response = await httpGet(
    method: webApiPickerSapGroup,
    query: {'EmpID': userController.user.value?.empID ?? 0},
  );
  if (response.resultCode == resultSuccess) {
    try {
      List<PickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapGroup.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}

///获取Sap工厂及仓库列表
Future getSapFactoryAndWarehouse() async {
  var response = await httpGet(method: webApiPickerSapFactoryAndWarehouse);
  if (response.resultCode == resultSuccess) {
    try {
      List<LinkPickerItem> list = [];
      for (var item in jsonDecode(response.data)) {
        list.add(PickerSapFactoryAndWarehouse.fromJson(item));
      }
      return list;
    } on Error catch (e) {
      logger.e(e);
      return 'json_format_error'.tr;
    }
  } else {
    return response.message;
  }
}
