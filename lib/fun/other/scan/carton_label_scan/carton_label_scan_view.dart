import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/widget/custom_widget.dart';
import 'package:jd_flutter_for_entrust/widget/edit_text_widget.dart';

import '../../../../bean/http/response/carton_label_scan_info.dart';
import '../../../../constant.dart';
import 'carton_label_scan_logic.dart';
import 'carton_label_scan_state.dart';

class CartonLabelScanPage extends StatefulWidget {
  const CartonLabelScanPage({super.key});

  @override
  State<CartonLabelScanPage> createState() => _CartonLabelScanPageState();
}

class _CartonLabelScanPageState extends State<CartonLabelScanPage> {
  final CartonLabelScanLogic logic = Get.put(CartonLabelScanLogic());
  final CartonLabelScanState state = Get.find<CartonLabelScanLogic>().state;

  TextEditingController controller = TextEditingController();

  _item(LinkDataSizeList data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade100, Colors.green.shade50],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSpan(hint: '尺码：', text: data.size ?? ''),
              textSpan(hint: '内标：', text: data.priceBarCode ?? ''),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSpan(
                hint: '贴标数量：',
                text: data.labelCount.toString(),
                textColor: Colors.black,
              ),
              textSpan(
                hint: '已扫数量：',
                text: data.scanned.toString(),
                textColor: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _methodChannel() {
    print('注册监听');
    const MethodChannel(channelScanFlutterToAndroid)
        .setMethodCallHandler((call) {
      switch (call.method) {
        case 'PdaScanner':
          {
            controller.text = call.arguments;
            logic.queryCartonLabelInfo(controller.text);
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
      actions: [
        IconButton(
          onPressed: () => logic.cleanAll(() => controller.text = ''),
          icon: const Icon(
            Icons.refresh,
            color: Colors.blue,
          ),
        )
      ],
      body: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: EditText(
                      hint: '请扫描或手动输入外箱贴标',
                      controller: controller,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        logic.queryCartonLabelInfo(controller.text),
                    icon: const Icon(Icons.search, color: Colors.blue),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue.shade200, Colors.green.shade50],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.blue.shade200, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        expandedTextSpan(hint: '外箱条码：', text: state.cartonLabel.value),
                        GestureDetector(
                          onTap: () => logic.cleanScanned(),
                          child: Container(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue, width: 2),
                            ),
                            child: Text(
                              '重扫内标',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    progressIndicator(
                      max: logic.labelTotal().toDouble(),
                      value: logic.scannedLabelTotal().toDouble(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: state.cartonInsideLabelList.length,
                  itemBuilder: (c, i) => _item(state.cartonInsideLabelList[i]),
                ),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    Get.delete<CartonLabelScanLogic>();
    super.dispose();
  }
}
