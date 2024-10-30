import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/purchase/purchase_logic.dart';

import '../bean/http/response/purchase_list_info.dart';
import '../widget/custom_widget.dart';
import '../widget/dialogs.dart';
import '../widget/edit_text_widget.dart';
import '../widget/picker/picker_view.dart';

class PurchaseOrderPage extends StatefulWidget {
  const PurchaseOrderPage({super.key});

  @override
  State<PurchaseOrderPage> createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage> {
  final logic = Get.put(PurchaseLogic());
  final state = Get.find<PurchaseLogic>().state;
  TextEditingController controller = TextEditingController();


  _item(PurchaseListInfo info) {
    return GestureDetector(
        onTap: () =>
        {
          state.searchInfo = info,
          state.searchSaleOrderDetail(
              info: info,
              error: (msg) => errorDialog(content: msg)),
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 55,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        expandedTextSpan(hint: ' 采购订单：', text: info.POOrderInterID.toString(),textColor: Colors.white,fontSize: 16),
                        expandedTextSpan(hint: ' 销售订单：', text: info.SaleOrderInterID.toString(),textColor: Colors.white,fontSize: 16),
                      ]),
                      expandedTextSpan(hint: ' 物料：', text: '(${info.MaterialNumber})${info.MaterialName}',textColor: Colors.white,fontSize: 16),
                    ],
                  ),
                ),
                Container(
                  height: 75,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightBlueAccent, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          expandedTextSpan(hint: ' 订单总量：', text: info.OrderQty.toString(),textColor: Colors.black,fontSize: 16),
                          expandedTextSpan(hint: ' 交货日期：', text: info.FetchDate.toString(),textColor: Colors.black,fontSize: 16),

                        ],
                      ),
                      Row(
                        children: [
                          expandedTextSpan(hint: ' 贴标生成：', text: info.LabelGenerateQty.toString(),textColor: Colors.black,fontSize: 16),
                          expandedTextSpan(hint: ' 贴标汇报：', text: info.ReportQty.toString(),textColor: Colors.black,fontSize: 16),
                        ],
                      ),
                      Row(
                        children: [
                          expandedTextSpan(hint: ' 贴标未生成：', text: info.LabelNotGenerateQty.toString(),textColor: Colors.black,fontSize: 16),
                          expandedTextSpan(hint: ' 未汇报数量：', text: info.NotReportQty.toString(),textColor: Colors.black,fontSize: 16),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  alignment: Alignment.centerRight,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: const Text(
                    '查看详情  ',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return pageBodyWithDrawer(
        title: '采购订单列表',
        queryWidgets: [
          EditText(
            hint: 'purchase_sale_order'.tr,
            onChanged: (v) => state.saleOrder = v,
          ),
          EditText(
            hint: 'purchase_sale_voucher'.tr,
            onChanged: (v) => state.voucherOrder = v,
          ),
          DatePicker(pickerController: logic.pickerControllerStartDate),
          DatePicker(pickerController: logic.pickerControllerEndDate),
        ],
        query: () =>
            state.searchSaleOrderList(
                startDate: logic.pickerControllerStartDate.getDateFormatYMD(),
                endDate: logic.pickerControllerEndDate.getDateFormatYMD(),
                error: (msg) => errorDialog(content: msg)),
        body: Obx(() =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: EditText(
                          hint: '请输入销售订单模糊查询'.tr,
                          controller: controller,
                          onChanged: (c) => {
                            c.isEmpty ? state.selectShowDataList('') : state.selectShowDataList('')

                          },
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () =>
                          {
                            state.selectShowDataList(controller.text),
                          },
                          child: const Icon(Icons.search),
                        ))
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemExtent: 160,
                      scrollDirection: Axis.vertical,
                      itemCount: state.showDataList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _item(state.showDataList[index]),
                    ))
              ],
            ))

    );
  }

  @override
  void dispose() {
    Get.delete<PurchaseLogic>();
    super.dispose();
  }
}
