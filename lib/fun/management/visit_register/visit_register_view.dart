import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../bean/http/response/visit_data_list_info.dart';
import '../../../route.dart';
import '../../../utils/web_api.dart';
import '../../../widget/custom_widget.dart';
import '../../../widget/picker/picker_view.dart';
import 'visit_register_logic.dart';

class VisitRegisterPage extends StatefulWidget {
  //界面
  const VisitRegisterPage({super.key});

  @override
  State<VisitRegisterPage> createState() => _VisitRegisterPageState();
}

class _VisitRegisterPageState extends State<VisitRegisterPage> {
  final logic = Get.put(VisitRegisterLogic());
  final state = Get
      .find<VisitRegisterLogic>()
      .state;

  var controller = EasyRefreshController(controlFinishRefresh: true);

  var inputNumber = [
    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
  ];

  visitButtonWidget({
    required String title,
    required Function click,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            click.call();
          },
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _item(VisitDataListInfo data) {
    return GestureDetector(
      onTap: () => {
        logger.f(data.toJson()),
        if(state.lastAdd){
          logic.getVisitorDetailInfo(data.interID.toString(),false),
          logger.f('1')
        }else{
          if(data.submitType==0){
            logic.getVisitorDetailInfo(data.interID.toString(),true),
            logger.f('2')
          }else{
            logic.getVisitorDetailInfo(data.interID.toString(),false),
            logger.f('3')
          }
        }
      }, //获取详情点击事件
      child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    //来访人
                      flex: 1,
                      child: Row(
                        children: [
                          Text(
                            'visit_item_people_name'.tr,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            data.name ?? "",
                            style: const TextStyle(color: Colors.blueAccent),
                          ),
                        ],
                      )),
                  Expanded(
                    //被访人
                      flex: 1,
                      child: Row(
                        children: [
                          Text('visit_item_interviewee_name'.tr),
                          const SizedBox(width: 5),
                          Text(data.intervieweeName ?? "",
                              style: const TextStyle(color: Colors.blueAccent))
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    //来访单位
                      flex: 1,
                      child: Row(
                        children: [
                          Text('visit_item_unit'.tr),
                          const SizedBox(width: 5),
                          Text(data.unit ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.blueAccent)),
                        ],
                      )),
                  Expanded(
                    //车牌号码
                      flex: 1,
                      child: Row(
                        children: [
                          Text('visit_item_license_plate_number'.tr),
                          const SizedBox(width: 5),
                          Text(
                              data.carNo?.replaceAll(RegExp(r'[\n\r]+'), ' ') ??
                                  "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.blueAccent))
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    //来访时间
                      flex: 1,
                      child: Row(
                        children: [
                          Text('visit_item_visiting_time'.tr),
                          const SizedBox(width: 5),
                          Text(data.dateTime ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w900)),
                        ],
                      )),
                  Expanded(
                    //离场时间
                      flex: 1,
                      child: Row(
                        children: [
                          Text('visit_item_departure'.tr),
                          const SizedBox(width: 5),
                          Text(data.leaveTime ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.blueAccent))
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          if(data.submitType == 1)
                            Text('visit_item_visiting_supplement'.tr,
                                style: const TextStyle(color: Colors.red)),
                        ],
                      )),
                ],
              ),
            ],
          )),
    );
  }

  _inputSearchText(String hint, List<TextInputFormatter>? inputType,
      TextEditingController? controller) {
    return Row(
      children: [
        Container(
          width: 50,
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: Text(hint, style: const TextStyle(color: Colors.black)),
        ),
        Expanded(
            child: CupertinoTextField(
              controller: controller,
              inputFormatters: inputType,
            )),
      ],
    );
  }

  ///最近来访记录
  showDialogLastRecord({
    context,
    Function()? click,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("最近来访记录"),
          content: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              _inputSearchText(
                  'visit_search_record_name'.tr, [], logic.textSearchName),
              const SizedBox(height: 5),
              _inputSearchText(
                  'visit_search_record_card'.tr, [], logic.textSearchIdCard),
              const SizedBox(height: 5),
              _inputSearchText('visit_search_record_phone'.tr, inputNumber,
                  logic.textSearchPhone),
              const SizedBox(height: 5),
              _inputSearchText(
                  'visit_search_record_car'.tr, [], logic.textSearchCar)
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("取消"),
            ),
            CupertinoDialogAction(
                onPressed: () {
                  click?.call();
                  Navigator.of(context).pop();
                },
                child: const Text("确定")),
          ],
        );
      },
    );
  }

  // listView() {
  //   return Obx(() => ListView.builder(
  //         padding: const EdgeInsets.all(8),
  //         itemCount: state.dataList.length,
  //         itemBuilder: (BuildContext context, int index) =>
  //             _item(state.dataList.toList()[index]),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return pageBodyWithBottomSheet(
        title: getFunctionTitle(),
        bottomSheet: [
          visitButtonWidget(
              title: 'visit_button_scan_invitation_code'.tr,
              click: () =>
              {
                // Get.to(() => const DailyReportPage()),   //跳转界面
              }),
          visitButtonWidget(
              title: 'visit_button_search_recent_records'.tr,
              click: () =>
              {
                Get.back(),
                showDialogLastRecord(   //搜索最近来访记录，带数据进行新增
                    context: context,
                    click: () {
                      state.lastAdd = true;
                      logic.getVisitLastList(refresh: () => controller.finishRefresh());
                    }),
              }),
          visitButtonWidget(
              title: 'visit_button_add_record'.tr,
              click: () async =>
              {
                Get.back(), //搜索框缩回
                logic.getToAddPage(),
              }),
          DatePicker(pickerController: logic.pickerControllerStartDate),
          DatePicker(pickerController: logic.pickerControllerEndDate),
          Obx(() =>
              Row(children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('全部'),
                    leading: Radio(
                      value: "",
                      groupValue: state.select.value,
                      onChanged: (v) {
                        state.select.value = v!;
                        logger.f(v);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('未离场'),
                    leading: Radio(
                      value: "0",
                      groupValue: state.select.value,
                      onChanged: (v) {
                        state.select.value = v!;
                        logger.f(v);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('已离场'),
                    leading: Radio(
                      value: "1",
                      groupValue: state.select.value,
                      onChanged: (v) {
                        state.select.value = v!;
                        logger.f(v);
                      },
                    ),
                  ),
                )
              ]))
        ],
        query: () => {
          logic.refreshGetVisitList(
              startTime: logic.pickerControllerStartDate.getDateFormatYMD(),
              endTime: logic.pickerControllerEndDate.getDateFormatYMD(),
              leave: state.select.value.toString())
        },
        body: Obx(() => Scaffold(
          backgroundColor: Colors.transparent,
          body: EasyRefresh(
            controller: controller,
            onRefresh: () =>
            {
              logic.refreshGetVisitList( leave: "0",
                refresh: () => controller.finishRefresh(),
              )
            },
            header: const MaterialHeader(),
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.dataList.length,
              itemBuilder: (BuildContext context, int index) =>
                  _item(state.dataList.toList()[index]),
            ),
          ),
        ))
    );
  }


  @override
  void dispose() {
    Get.delete<VisitRegisterLogic>();
    controller.dispose();
    super.dispose();
  }
}
