import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/purchase/purchase_logic.dart';
import 'package:jd_flutter_for_entrust/utils/printer/tsc_util.dart';
import 'package:jd_flutter_for_entrust/widget/custom_widget.dart';
import '../bean/http/response/purchase_detail_list_info.dart';
import '../utils/printer/print_util.dart';
import '../utils/utils.dart';
import '../widget/check_box_widget.dart';
import '../widget/combination_button_widget.dart';
import '../widget/dialogs.dart';
import '../widget/switch_button_widget.dart';

class PurchaseDetailPage extends StatelessWidget {
  PurchaseDetailPage({super.key});

  final PrintUtil pu = PrintUtil();

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PurchaseLogic>();
    final state = Get.find<PurchaseLogic>().state;
    state.labelController.text = '';
    var boxQtyController = TextEditingController();
    boxQtyController.text = spGet('purchase/boxNumber')??"";

    printLabel(bool oneTime, int index) async {
      var labelList = <List<Uint8List>>[];
      Map<String, List<List<String>>> tableData = {};

      if (oneTime) {

        for (int i = 0; i < state.labelDataList.length; i++) {
          if (i == index) {
            List<List<String>> data = [];
            var allQty = 0.0;
            for (int t = 0;
                t < state.labelDataList[i].labelSizeInfos!.length;
                t++) {
              allQty += state.labelDataList[i].labelSizeInfos![t].LabelQty!;
              data.add([
                state.labelDataList[i].labelSizeInfos![t].Size.toString(),
                state.labelDataList[i].labelSizeInfos![t].LabelQty
                    .toShowString(),
              ]);
            }
            // 使用数据的索引作为key
            tableData[state.labelDataList[i].SaleOrderNo.toString()] = data;
            labelList.add(await labelMultipurposeDynamic(
              qrCode: state.labelDataList[i].CardNo.toString(),
              title: state.labelDataList[i].ModelName.toString(),
              subTitle: "(${state.labelDataList[i].SupplierNumber})${state.detail.MaterialName}",
              tableTitle: state.labelDataList[i].SaleOrderNo.toString(),
              tableTitleTips: '总数：${allQty.toShowString()}',
              tableFirstLineTitle: '尺码',
              tableLastLineTitle: '合计',
              tableData: tableData,
              bottomLeftText2: '交期：${state.labelDataList[i].FetchDate}',
              bottomRightText1: '装箱：${state.labelDataList[i].PackType}',
              bottomRightText2: '序号：${state.labelDataList[i].LabelIndex}',
            ));
          }
        }
      } else {
        for (int i = 0; i < state.labelDataList.length; i++) {

          if (state.labelDataList[i].labelSelect.value == true) {
            List<List<String>> data = [];
            var allQty = 0.0;
            for (int t = 0;
                t < state.labelDataList[i].labelSizeInfos!.length;
                t++) {
              allQty += state.labelDataList[i].labelSizeInfos![t].LabelQty!;
              data.add([
                state.labelDataList[i].labelSizeInfos![t].Size.toString(),
                state.labelDataList[i].labelSizeInfos![t].LabelQty
                    .toShowString(),
              ]);
            }
            // 使用数据的索引作为key
            tableData[state.labelDataList[i].SaleOrderNo.toString()] = data;
            labelList.add(await labelMultipurposeDynamic(
              qrCode: state.labelDataList[i].CardNo.toString(),
              title: state.labelDataList[i].ModelName.toString(),
              subTitle: state.labelDataList[i].SaleOrderNo.toString(),
              tableTitle: state.labelDataList[i].SupplierNumber.toString(),
              tableTitleTips: '总数：${allQty.toShowString()}',
              tableFirstLineTitle: '尺码',
              tableLastLineTitle: '合计',
              tableData: tableData,
              bottomLeftText2: '交期：${state.labelDataList[i].FetchDate}',
              bottomRightText1: '装箱：${state.labelDataList[i].PackType}',
              bottomRightText2: '序号：${state.labelDataList[i].LabelIndex}',
            ));
          }
        }
      }

      pu.printLabelList(
        labelList: labelList,
        start: () {
          loadingDialog('正在下发标签...');
        },
        progress: (i, j) {
          Get.back();
          loadingDialog('正在下发标签($i/$j)');
        },
        finished: (success, fail) {
          Get.back();
          successDialog(
              title: '标签下发结束',
              content: '完成${success.length}张, 失败${fail.length}张',
              back: () {
                state.setPrintLabelFlag(
                    success: (msg) => successDialog(
                        content: msg,
                        back: () => {
                              state.searchSaleOrderDetail(
                                  info: state.searchInfo,
                                  error: (msg) => errorDialog(content: msg))
                            }),
                    error: (msg) => errorDialog(content: msg));
              });
        },
      );
    }

    item(int index, OrderSizeInfos info) {
      return GestureDetector(
        onTap: () {
          state.selectSizePosition(index);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: info.select.value ? Colors.green.shade100 : Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xff2165A8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    expandedTextSpan(
                      hint: '尺码：',
                      text: info.Size.toString(),
                      fontSize: 16,
                      hintColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    expandedTextSpan(
                      hint: '总数：',
                      text: info.OrderQty.toString(),
                      fontSize: 16,
                      hintColor: Colors.white,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    expandedTextSpan(
                      hint: '已生成：',
                      text: info.LabelGenerateQty.toString(),
                    ),
                    expandedTextSpan(
                      hint: '未生成：',
                      text: info.LabelNotGenerateQty.toString(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                child: Row(
                  children: [
                    expandedTextSpan(
                      hint: '箱容：',
                      text: info.boxSize.toString(),
                    ),
                    expandedTextSpan(
                      hint: '可生成：',
                      text: info.labelNumber().ceil().toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    labelItem(int index, LabelInfos label) {
      return GestureDetector(
        onTap: () {
          state.selectLabelPosition(index);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color:
                label.labelSelect.value ? Colors.green.shade100 : Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xff2165A8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    expandedTextSpan(
                      flex: 3,
                      hint: '指令号：',
                      text: label.SaleOrderNo.toString(),
                      fontSize: 16,
                      hintColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    expandedTextSpan(
                      flex: 2,
                      hint: '贴标序号：',
                      text: label.LabelIndex.toString(),
                      fontSize: 16,
                      hintColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    Expanded(
                        child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        askDialog(
                          content:
                              '确定要打印贴标序号<${label.LabelIndex.toString()}>的标签吗',
                          confirm: () => {printLabel(true, index)},
                        )
                      },
                      child: const Icon(
                        color: Colors.white,
                        Icons.print,
                        size: 20,
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    expandedTextSpan(
                      hint: '装箱方式：',
                      text: label.PackType.toString(),
                    ),
                    expandedTextSpan(
                      hint: '汇报状态：',
                      text: label.LabelQty == 0 ? '已汇报' : '未汇报',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    expandedTextSpan(
                        hint: '打印状态：',
                        text: label.IsBillPrint == 0 ? "未打印" : "已打印",
                        textColor: label.IsBillPrint == 0
                            ? Colors.red
                            : Colors.greenAccent),
                    expandedTextSpan(
                      hint: '可生成：',
                      text: '8',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                child: Row(
                  children: [
                    expandedTextSpan(
                      hint: '贴标数据：',
                      text: label.labelSizeMes(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    var page1 = Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              expandedTextSpan(hint: ' 采购订单：', text: '4500955174'),
              expandedTextSpan(hint: ' 销售订单：', text: '4500955174'),
            ],
          ),
          textSpan(hint: ' 物料：', text: '(800203687)鞋面-PNS24395018-18'),
          Row(
            children: [
              const Text(' 箱容：'),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: boxQtyController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: 10,
                      right: 10,
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
              CombinationButton(
                  // isEnabled: state.detail.LabelGenerateEnable == 0 ? false : true,
                  text: '设置',
                  click: () {
                    state.setSizeBox(
                        number: boxQtyController.text.toString(),
                        error: (msg) => errorDialog(content: msg));
                  }),
              SwitchButton(
                onChanged: (isChecked) {},
                name: '混码装：',
              ),
            ],
          ),
          Row(
            children: [
              const Text(' 生成贴标'),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  state.addOrRemoveLabelNumber(
                      isAdd: false,
                      error: (String msg) {
                        errorDialog(content: msg);
                      });
                },
                icon: const Icon(
                  Icons.do_disturb_on_outlined,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: state.labelController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: 10,
                      right: 10,
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  state.addOrRemoveLabelNumber(
                      isAdd: true,
                      error: (String msg) {
                        errorDialog(content: msg);
                      });
                },
                icon: const Icon(
                  Icons.control_point,
                  color: Colors.blue,
                ),
              ),
              Obx(
                () => CheckBox(
                  onChanged: (isChecked) {
                    state.maxLabel.value = isChecked;
                    state.setMaxLabel(isChecked);
                  },
                  name: '按最大贴标生成',
                  value: state.maxLabel.value,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: CombinationButton(
                text: '全选',
                click: () {
                  state.selectClick(true);
                },
                // isEnabled: state.detail.LabelGenerateEnable == 0 ? false : true,
                combination: Combination.left,
              )),
              Expanded(
                  child: CombinationButton(
                // isEnabled: state.detail.LabelGenerateEnable == 0 ? false : true,
                text: '取消全选',
                click: () {
                  state.selectClick(false);
                },
                combination: Combination.middle,
              )),
              Expanded(
                  child: CombinationButton(
                // isEnabled: state.detail.LabelGenerateEnable == 0 ? false : true,
                text: '创建',
                click: () {
                  state.generatePackingLabelCode(
                    labelQty: state.labelController.text,
                    error: (msg) => errorDialog(content: msg),
                    success: (String msg) {
                      //刷新数据
                      successDialog(
                          content: msg,
                          back: () {
                            state.searchSaleOrderDetail(
                                info: state.searchInfo,
                                error: (msg) => errorDialog(content: msg));
                          });
                    },
                  );
                },
                combination: Combination.right,
              )),
            ],
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: state.detailDataList.length,
                itemBuilder: (context, index) =>
                    item(index, state.detailDataList[index]))),
          )
        ],
      ),
    );
    var page2 = Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: CombinationButton(
                text: '全选',
                click: () {
                  state.selectLabel(true);
                },
                combination: Combination.left,
              )),
              Expanded(
                  child: CombinationButton(
                text: '取消全选',
                click: () {
                  state.selectLabel(false);
                },
                combination: Combination.middle,
              )),
              Expanded(
                  child: CombinationButton(
                text: '打印',
                click: () {
                  if (state.addDataToSizeMap()) {
                    printLabel(false, 0);
                  } else {
                    errorDialog(content: '请选择贴标');
                  }
                },
                combination: Combination.middle,
              )),
              Expanded(
                  child: CombinationButton(
                text: '删除',
                click: () {
                  askDialog(
                    content: '确定要删除标签吗',
                    confirm: () => {
                      state.poDelBarcode(
                          error: (msg) => errorDialog(content: msg),
                          success: (String msg) {
                            successDialog(
                                content: msg,
                                back: () {
                                  state.searchSaleOrderDetail(
                                      info: state.searchInfo,
                                      error: (msg) =>
                                          errorDialog(content: msg));
                                });
                          }),
                    },
                  );
                },
                combination: Combination.right,
              )),
            ],
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: state.labelDataList.length,
                itemBuilder: (context, index) =>
                    labelItem(index, state.labelDataList[index]))),
          )
        ],
      ),
    );
    return pageBody(
      title: '订单详情',
      body: Obx(() => Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                state.currentPage.value = index;
              },
              indicatorColor: Colors.amber,
              selectedIndex: state.currentPage.value,
              destinations: const <Widget>[
                NavigationDestination(
                  icon: Icon(Icons.done_sharp),
                  label: '创建',
                ),
                NavigationDestination(
                  icon: Badge(child: Icon(Icons.list_alt)),
                  label: '贴标',
                ),
              ],
            ),
            body: [page1, page2][state.currentPage.value],
          )),
    );
  }
}
