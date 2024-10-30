import 'package:get/get.dart';

class ScanLabelInfos {
  ScanLabelInfos({
    this.cardNo,
    this.saleOrderNo,
    this.labelIndex,
    this.packType,
    this.isScReport,
    this.isBillPrint,
    this.size,
    this.labelQty,
  });

  ScanLabelInfos.fromJson(dynamic json) {
    labelQty = json['LabelQty'];
    cardNo = json['CardNo'];
    saleOrderNo = json['SaleOrderNo'];
    labelIndex = json['LabelIndex'];
    packType = json['PackType'];
    isScReport = json['IsScReport'];
    isBillPrint = json['IsBillPrint'];
    size = json['Size'];
  }

  String? cardNo;
  String? saleOrderNo;
  int? labelIndex;
  String? packType;
  int? isScReport;
  int? isBillPrint;
  double? size;
  double? labelQty;
  var isAdd =false.obs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['Size'] = size;
    map['CardNo'] = cardNo;
    map['SaleOrderNo'] = saleOrderNo;
    map['LabelIndex'] = labelIndex;
    map['PackType'] = packType;
    map['IsScReport'] = isScReport;
    map['IsBillPrint'] = isBillPrint;
    map['LabelQty'] = labelQty;
    return map;
  }
}
