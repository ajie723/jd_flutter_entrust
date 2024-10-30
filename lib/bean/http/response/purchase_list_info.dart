
class PurchaseListInfo {
  PurchaseListInfo({
    this.POOrderInterID,  //采购订单ID
    this.SaleOrderInterID,  //销售订单ID
    this.POOrderNo,  //采购订单号
    this.SaleOrderNo,  //销售订单号
    this.OrderQty,  //订单总量
    this.FetchDate,  //交货日期
    this.LabelGenerateQty,  //贴标生成
    this.LabelNotGenerateQty,  //贴标未生成
    this.ReportQty,  //汇报数量
    this.NotReportQty,  //未汇报数量
    this.MaterialNumber,  //物料名称
    this.MaterialName,  //物料ID

  });

  PurchaseListInfo.fromJson(dynamic json) {
    LabelNotGenerateQty = json['LabelNotGenerateQty'];
    MaterialName = json['MaterialName'];
    POOrderInterID = json['POOrderInterID'];
    MaterialNumber = json['MaterialNumber'];
    SaleOrderInterID = json['SaleOrderInterID'];
    POOrderNo = json['POOrderNo'];
    SaleOrderNo = json['SaleOrderNo'];
    OrderQty = json['OrderQty'];
    FetchDate = json['FetchDate'];
    LabelGenerateQty = json['LabelGenerateQty'];
    ReportQty = json['ReportQty'];
    NotReportQty = json['NotReportQty'];

  }

  int? POOrderInterID;
  String? MaterialName;
  String? MaterialNumber;
  int? SaleOrderInterID;
  String? POOrderNo;
  String? SaleOrderNo;
  double? OrderQty;
  double? LabelNotGenerateQty;
  String? FetchDate;
  double? LabelGenerateQty;
  double? ReportQty;
  double? NotReportQty;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LabelNotGenerateQty'] = LabelNotGenerateQty;
    map['MaterialName'] = MaterialName;
    map['MaterialNumber'] = MaterialNumber;
    map['POOrderInterID'] = POOrderInterID;
    map['SaleOrderInterID'] = SaleOrderInterID;
    map['POOrderNo'] = POOrderNo;
    map['SaleOrderNo'] = SaleOrderNo;
    map['OrderQty'] = OrderQty;
    map['FetchDate'] = FetchDate;
    map['LabelGenerateQty'] = LabelGenerateQty;
    map['ReportQty'] = ReportQty;
    map['NotReportQty'] = NotReportQty;
    return map;
  }
}
