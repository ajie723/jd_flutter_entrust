import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/labelReport/label_report_logic.dart';
import 'package:jd_flutter_for_entrust/utils/web_api.dart';
import '../bean/http/response/label_report_list_info.dart';
import '../bean/http/response/scan_label_infos.dart';
import '../constant.dart';
import '../widget/combination_button_widget.dart';
import '../widget/custom_widget.dart';
import '../widget/dialogs.dart';
import '../widget/edit_text_widget.dart';

class LabelReportPage extends StatefulWidget {
  const LabelReportPage({super.key});

  @override
  State<LabelReportPage> createState() => _LabelReportPageState();
}

var list = <String>['1', '2', '3', '4,', '5'];

class _LabelReportPageState extends State<LabelReportPage> {
  final logic = Get.put(LabelReportLogic());
  final state = Get.find<LabelReportLogic>().state;
  TextEditingController controller = TextEditingController();

  _item(LabelReportListInfo item, int index) {
    return Card(
      color: Colors.blue[200],
      child: InkWell(
        onLongPress: () {
          askDialog(
              content: '确定要删除该采购订单吗？',
              confirm: () {
                state.removeShowData(index);
              });
        },
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Row(
            children: [
              expandedTextSpan(
                  hint: '采购订单：',
                  text: item.pOOrderInterID.toString(),
                  textColor: Colors.black),
              expandedTextSpan(
                  hint: '销售订单：：',
                  text: item.saleOrderInterID.toString(),
                  textColor: Colors.black),
            ],
          ),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                expandedTextSpan(
                    hint: ' 订单总量：',
                    text: item.orderQty.toString(),
                    textColor: Colors.black),
                expandedTextSpan(
                    hint: '本次扫码：',
                    text: item.thisTimeScan.toString(),
                    textColor: Colors.black)
              ],
            ),
            Row(
              children: [
                expandedTextSpan(
                    hint: ' 已汇报数：',
                    text: item.reportQty.toString(),
                    textColor: Colors.black),
                expandedTextSpan(
                    hint: '欠数：',
                    hintColor: Colors.red,
                    text: item.notReportQty.toString(),
                    textColor: Colors.red)
              ],
            ),
          ]),
          children: [
            for (var item in item.scanLabelInfos!)
              Column(
                children: [
                  _listTile(item),
                ],
              )
          ],
        ),
      ),
    );
  }

  _listTile(ScanLabelInfos item) {
    return Card(
        color: item.isAdd.value ? Colors.amber : Colors.white,
        child: ExpansionTile(
          showTrailingIcon: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Row(
            children: [
              expandedTextSpan(
                  hint: '  尺码：',
                  text: item.size.toString(),
                  textColor: Colors.black),
              expandedTextSpan(
                  hint: ' 贴标序号：',
                  text: item.labelIndex.toString(),
                  textColor: Colors.black),
            ],
          ),
          subtitle: Row(
            children: [
              expandedTextSpan(
                  hint: '  贴标数量：',
                  text: item.labelQty.toString(),
                  textColor: Colors.black),
              expandedTextSpan(
                  hint: ' 报工状态：',
                  text: item.isBillPrint == 0 ? '未报工' : '已报工',
                  textColor:
                      item.isBillPrint == 0 ? Colors.red : Colors.greenAccent),
            ],
          ),
        ));
  }

  _methodChannel() {
    const MethodChannel(channelScanFlutterToAndroid)
        .setMethodCallHandler((call) {
      switch (call.method) {
        case 'PdaScanner':
          {
            controller.text = call.arguments;

            if (state.showSubDataList.isNotEmpty) {
              //判断列表是否为空

              logger.f('走不为空');

              if (state.haveLabel(call.arguments.toString())) {
                state.addThisTimeQty(call.arguments.toString());
              } else {
                state.getPurchaseOrderInfo4Report(
                    code: call.arguments,
                    error: (s) => errorDialog(content: s));
              }
            } else {
              logger.f('走空');
              //列表为空走接口
              state.getPurchaseOrderInfo4Report(
                  code: call.arguments.toString(),
                  error: (s) => errorDialog(content: s));
            }
          }
          break;
      }
      return Future.value(call);
    });
  }

  @override
  void initState() {
    super.initState();
    _methodChannel();
  }

  @override
  Widget build(BuildContext context) {
    return pageBody(
        title: '条码采集',
        body: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: EditText(
                          hint: '请扫描贴标二维码或手动添加',
                          controller: controller,
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => {
                            // state.getPurchaseOrderInfo4Report(
                            //   error: (msg) => errorDialog(content: msg),
                            // )
                          },
                          child: const Icon(Icons.search),
                        ))
                  ],
                ),
                // Expanded(
                //     child: SingleChildScrollView(
                //   child: Container(
                //     child: _bottomListView(),
                //   ),
                // )),
                Expanded(
                    child: ListView.builder(
                  padding: const EdgeInsets.all(3),
                  itemCount: state.showSubDataList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _item(state.showSubDataList[index], index),
                )),
                SizedBox(
                  width: double.maxFinite,
                  child: CombinationButton(
                    text: '提   交',
                    click: () => {
                      askDialog(
                          content: '确定要提交条码数据吗?',
                          confirm: () {
                            state.purchaseOrderScanReport(
                                success: (msg) => {
                                      successDialog(
                                          content: msg,
                                          back: () => {
                                              state.clearListData(),
                                            controller.clear()
                                              }),
                                    },
                                error: (msg) => errorDialog(content: msg));
                          }),
                    },
                  ),
                )
              ],
            )));
  }
}
