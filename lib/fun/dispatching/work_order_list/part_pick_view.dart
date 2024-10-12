import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jd_flutter/fun/dispatching/work_order_list/work_order_list_logic.dart';
import 'package:jd_flutter/widget/custom_widget.dart';

import '../../../bean/http/response/part_detail_info.dart';
import '../../../widget/combination_button_widget.dart';

class PartPickPage extends StatefulWidget {
  const PartPickPage({super.key});

  @override
  State<PartPickPage> createState() => _PartPickPageState();
}

class _PartPickPageState extends State<PartPickPage> {
  final logic = Get.find<WorkOrderListLogic>();
  final state = Get.find<WorkOrderListLogic>().state;

  _item(PartInfo data) {
    var name = '';
    if (data.linkPartName?.isEmpty == true) {
      name = data.partName ?? '';
    } else {
      name = data.linkPartName?.join(',') ?? '';
    }
    return GestureDetector(
      onTap: () => showSnackBar(title: '部件', message: name),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Checkbox(
                value: data.select,
                onChanged: (b) {
                  data.select = b!;
                  state.partList.refresh();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      logic.queryPartList();
    });
    return pageBody(
      title: '选择部件',
      actions: [
        CombinationButton(
          text: '提交',
          click: () => logic.submitCheck(),
        ),
        const SizedBox(width: 20),
      ],
      body: Obx(() => ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.partList.length,
            itemBuilder: (context, index) => _item(state.partList[index]),
          )),
    );
  }
}
