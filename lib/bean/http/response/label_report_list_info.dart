import 'package:jd_flutter_for_entrust/bean/http/response/scan_label_infos.dart';

class LabelReportListInfo {
  LabelReportListInfo({
    this.scanLabelInfos,
    this.pOOrderInterID,
    this.saleOrderInterID,
    this.pOOrderNo,
    this.saleOrderNo,
    this.materialNumber,
    this.materialName,
    this.orderQty,
    this.reportQty,
    this.notReportQty,
  });

  LabelReportListInfo.fromJson(dynamic json) {
    if (json['ScanLabelInfos'] != null) {
      scanLabelInfos = [];
      json['ScanLabelInfos'].forEach((v) {
        scanLabelInfos?.add(ScanLabelInfos.fromJson(v));
      });
    }
    pOOrderInterID = json['POOrderInterID'];
    saleOrderInterID = json['SaleOrderInterID'];
    pOOrderNo = json['POOrderNo'];
    saleOrderNo = json['SaleOrderNo'];
    materialNumber = json['MaterialNumber'];
    materialName = json['MaterialName'];
    orderQty = json['OrderQty'];
    reportQty = json['ReportQty'];
    notReportQty = json['NotReportQty'];
  }

  List<ScanLabelInfos>? scanLabelInfos;
  int? pOOrderInterID;
  int? saleOrderInterID;
  String? pOOrderNo;
  String? saleOrderNo;
  String? materialNumber;
  String? materialName;
  double? orderQty;
  double? reportQty;
  double? notReportQty;
  double? thisTimeScan=0.0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (scanLabelInfos != null) {
      map['ScanLabelInfos'] = scanLabelInfos?.map((v) => v.toJson()).toList();
    }
    map['POOrderInterID'] = pOOrderInterID;
    map['SaleOrderInterID'] = saleOrderInterID;
    map['POOrderNo'] = pOOrderNo;
    map['SaleOrderNo'] = saleOrderNo;
    map['MaterialNumber'] = materialNumber;
    map['MaterialName'] = materialName;
    map['OrderQty'] = orderQty;
    map['ReportQty'] = reportQty;
    map['NotReportQty'] = notReportQty;
    return map;
  }

}
