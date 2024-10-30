import 'package:get/get.dart';
import 'package:jd_flutter_for_entrust/utils/utils.dart';

class PurchaseDetailListInfo {
  PurchaseDetailListInfo({
    this.POOrderInterID,
    this.SaleOrderInterID,
    this.POOrderNo,
    this.SaleOrderNo,
    this.MaterialNumber,
    this.MaterialName,
    this.LabelGenerateEnable,
    this.orderSizeInfos,
    this.labelInfos,
  });

  PurchaseDetailListInfo.fromJson(dynamic json) {
    POOrderInterID = json['POOrderInterID'];
    SaleOrderInterID = json['SaleOrderInterID'];
    POOrderNo = json['POOrderNo'];
    SaleOrderNo = json['SaleOrderNo'];
    MaterialNumber = json['MaterialNumber'];
    MaterialName = json['MaterialName'];
    LabelGenerateEnable = json['LabelGenerateEnable'];
    if (json['OrderSizeInfos'] != null) {
      orderSizeInfos = [];
      json['OrderSizeInfos'].forEach((v) {
        orderSizeInfos?.add(OrderSizeInfos.fromJson(v));
      });
    }
    if (json['LabelInfos'] != null) {
      labelInfos = [];
      json['LabelInfos'].forEach((v) {
        labelInfos?.add(LabelInfos.fromJson(v));
      });
    }
  }

  List<OrderSizeInfos>? orderSizeInfos;
  List<LabelInfos>? labelInfos;
  int? POOrderInterID; //采购订单ID
  int? SaleOrderInterID; //销售订单ID
  String? POOrderNo; //采购订单号
  String? SaleOrderNo; //采购订单号
  String? MaterialNumber; //物料id
  String? MaterialName; //物料名称
  int? LabelGenerateEnable; //0不允许操作，

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orderSizeInfos != null) {
      map['OrderSizeInfos'] = orderSizeInfos?.map((v) => v.toJson()).toList();
    }
    if (labelInfos != null) {
      map['LabelInfos'] = labelInfos?.map((v) => v.toJson()).toList();
    }
    map['POOrderInterID'] = POOrderInterID;
    map['SaleOrderInterID'] = SaleOrderInterID;
    map['POOrderNo'] = POOrderNo;
    map['SaleOrderNo'] = SaleOrderNo;
    map['MaterialNumber'] = MaterialNumber;
    map['MaterialName'] = MaterialName;
    map['LabelGenerateEnable'] = LabelGenerateEnable;

    return map;
  }
}

class LabelInfos {
  LabelInfos({
    this.CardNo,
    this.LargeCardNo,
    this.SaleOrderNo,
    this.LabelIndex,
    this.PackType,
    this.IsScReport,
    this.IsBillPrint,
    this.PackageInterID,
    this.labelSizeInfos,
    this.SupplierNumber,
    this.ModelName,
    this.FetchDate,

  });

  LabelInfos.fromJson(dynamic json) {
    if (json['labelSizeInfos'] != null) {
      labelSizeInfos = [];
      json['labelSizeInfos'].forEach((v) {
        labelSizeInfos?.add(labelSizeInfo.fromJson(v));
      });
    }
    FetchDate = json['FetchDate'];
    ModelName = json['ModelName'];
    SupplierNumber = json['SupplierNumber'];
    PackageInterID = json['PackageInterID'];
    CardNo = json['CardNo'];
    LargeCardNo = json['LargeCardNo'];
    SaleOrderNo = json['SaleOrderNo'];
    LabelIndex = json['LabelIndex'];
    PackType = json['PackType'];
    IsScReport = json['IsScReport'];
    IsBillPrint = json['IsBillPrint'];
    Size = json['Size'];
    LabelQty = json['LabelQty'];
  }

  List<labelSizeInfo>? labelSizeInfos;
  String? FetchDate; //交期
  String? ModelName; //型体
  String? SupplierNumber; //供应商代码
  String? CardNo; //标签
  String? LargeCardNo; //混码标
  String? SaleOrderNo; //指令号
  int? LabelIndex; //贴标序号
  String? PackType; //装箱方式
  int? IsScReport; //是否汇报
  int? PackageInterID; //包装清单ID
  int? IsBillPrint; //是否打印
  String? Size; //尺码
  double? LabelQty; //贴标数量
  var labelSelect =false.obs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (labelSizeInfos != null) {
      map['labelSizeInfos'] = labelSizeInfos?.map((v) => v.toJson()).toList();
    }
    map['FetchDate'] = FetchDate;
    map['ModelName'] = ModelName;
    map['SupplierNumber'] = SupplierNumber;
    map['PackageInterID'] = PackageInterID;
    map['CardNo'] = CardNo;
    map['LargeCardNo'] = LargeCardNo;
    map['SaleOrderNo'] = SaleOrderNo;
    map['LabelIndex'] = LabelIndex;
    map['PackType'] = PackType;
    map['IsScReport'] = IsScReport;
    map['Size'] = Size;
    map['LabelQty'] = Size;

    return map;
  }

  String labelSizeMes() {
    var mes = '';

    if(labelSizeInfos!.isNotEmpty){
      for (int i = 0; i <labelSizeInfos!.length ; i++) {
        mes+= "<${labelSizeInfos![i].Size}#-${labelSizeInfos![i].LabelQty}>";
      }
    }

    return mes;
  }
}



class OrderSizeInfos {
  OrderSizeInfos({
    this.POOrderInterID,
    this.SaleOrderInterID,
    this.Size,
    this.OrderQty,
    this.LabelGenerateQty,
    this.LabelNotGenerateQty,
  });

  OrderSizeInfos.fromJson(dynamic json) {
    POOrderInterID = json['POOrderInterID'];
    SaleOrderInterID = json['SaleOrderInterID'];
    Size = json['Size'];
    OrderQty = json['OrderQty'];
    LabelGenerateQty = json['LabelGenerateQty'];
    LabelNotGenerateQty = json['LabelNotGenerateQty'];
  }

  int? POOrderInterID;
  int? SaleOrderInterID;
  String? Size; //尺码
  double? OrderQty; //数量
  double? LabelGenerateQty; //已经生成
  double? LabelNotGenerateQty; //未生成
  int? boxSize = 0; //箱容
  var select =false.obs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['POOrderInterID'] = POOrderInterID;
    map['SaleOrderInterID'] = SaleOrderInterID;
    map['Size'] = Size;
    map['OrderQty'] = OrderQty;
    map['LabelGenerateQty'] = LabelGenerateQty;
    map['LabelNotGenerateQty'] = LabelNotGenerateQty;

    return map;
  }

  double labelNumber() {
    if (boxSize! <= 0) {
      return 0;
    } else {
      return LabelNotGenerateQty!.div(boxSize.toString().toDoubleTry());
    }
  }
}

class labelSizeInfo {
  labelSizeInfo({
    this.Size,
    this.LabelQty,
  });

  labelSizeInfo.fromJson(dynamic json) {
    Size = json['Size'];
    LabelQty = json['LabelQty'];

  }

  String? Size;
  double? LabelQty;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Size'] = Size;
    map['LabelQty'] = LabelQty;


    return map;
  }
}
