import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jd_flutter/route.dart';

import '../../../utils.dart';
import '../../../widget/custom_widget.dart';
import '../../../widget/picker/picker_view.dart';
import 'molding_pack_area_report_logic.dart';
///开发中-------------------------------------------------------------------------------------------------------------------------------------
class MoldingPackAreaReportPage extends StatefulWidget {
  const MoldingPackAreaReportPage({Key? key}) : super(key: key);

  @override
  State<MoldingPackAreaReportPage> createState() =>
      _MoldingPackAreaReportPageState();
}

class _MoldingPackAreaReportPageState extends State<MoldingPackAreaReportPage> {
  final logic = Get.put(MoldingPackAreaReportPageLogic());
  final state = Get.find<MoldingPackAreaReportPageLogic>().state;
  var textColor = const TextStyle(color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return pageBodyWithDrawer(
      title: getFunctionTitle(),
      children: [
        EditText(
          hint: 'page_molding_pack_area_report_query_instruction'.tr,
          controller: logic.textControllerInstruction,
        ),
        const SizedBox(height: 10),
        EditText(
          hint: 'page_molding_pack_area_report_query_order_number'.tr,
          controller: logic.textControllerOrderNumber,
        ),
        const SizedBox(height: 10),
        EditText(
          hint: 'page_molding_pack_area_report_query_type_body'.tr,
          controller: logic.textControllerTypeBody,
        ),
        DatePicker(pickerController: logic.dateControllerStart),
        DatePicker(pickerController: logic.dateControllerEnd),
        CheckBox(checkBoxController: logic.checkBoxController)
      ],
      query: () => logic.query(),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() => DataTable(
                  border: TableBorder.all(color: Colors.black, width: 1),
                  showCheckboxColumn: false,
                  headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return Colors.blueAccent.shade100;
                    },
                  ),
                  columns: state.tableDataColumn,
                  rows: [
                    for (var i = 0; i < state.tableData.length; ++i)
                      state.createTableDataRow(
                        state.tableData[i],
                        i.isEven ? Colors.transparent : Colors.grey.shade100,
                        (id, no) => logic.getDetails(id, no),
                      )
                  ],
                )),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MoldingPackAreaReportPageLogic>();
    super.dispose();
  }
}
