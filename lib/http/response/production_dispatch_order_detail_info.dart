/// WorkCardList : [{"ID":0,"InterID":0,"EntryID":1,"OperPlanningEntryFID":3714871,"EmpID":0,"WorkerCode":"0","WorkerName":"","SourceQty":1463,"MustQty":1463,"PreSchedulingQty":0,"Qty":1463,"FinishQty":0,"SourceEntryID":2,"SourceInterID":213014,"SourceEntryFID":555546,"ProcessNumber":"YT","ProcessName":"沿条","IsOpen":1,"RoutingID":162132}]
/// WorkCardTitle : {"FQtyPass":1463,"FQtyProcessPass":0,"DayWorkCardPlanQty":0,"FCardNoReportStatus":0,"PlantBody":"","ProcessBillNumber":"P2048549","DispatchingNumber":1463}

class ProductionDispatchOrderDetailInfo {
  ProductionDispatchOrderDetailInfo({
    this.workCardList,
    this.workCardTitle,
  });

  ProductionDispatchOrderDetailInfo.fromJson(dynamic json) {
    if (json['WorkCardList'] != null) {
      workCardList = [];
      json['WorkCardList'].forEach((v) {
        workCardList?.add(WorkCardList.fromJson(v));
      });
    }
    workCardTitle = json['WorkCardTitle'] != null
        ? WorkCardTitle.fromJson(json['WorkCardTitle'])
        : null;
  }

  List<WorkCardList>? workCardList;
  WorkCardTitle? workCardTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (workCardList != null) {
      map['WorkCardList'] = workCardList?.map((v) => v.toJson()).toList();
    }
    if (workCardTitle != null) {
      map['WorkCardTitle'] = workCardTitle?.toJson();
    }
    return map;
  }
}

/// FQtyPass : 1463
/// FQtyProcessPass : 0
/// DayWorkCardPlanQty : 0
/// FCardNoReportStatus : 0
/// PlantBody : ""
/// ProcessBillNumber : "P2048549"
/// DispatchingNumber : 1463

class WorkCardTitle {
  WorkCardTitle({
    this.fQtyPass,
    this.fQtyProcessPass,
    this.dayWorkCardPlanQty,
    this.fCardNoReportStatus,
    this.plantBody,
    this.processBillNumber,
    this.dispatchingNumber,
  });

  WorkCardTitle.fromJson(dynamic json) {
    fQtyPass = json['FQtyPass'];
    fQtyProcessPass = json['FQtyProcessPass'];
    dayWorkCardPlanQty = json['DayWorkCardPlanQty'];
    fCardNoReportStatus = json['FCardNoReportStatus'];
    plantBody = json['PlantBody'];
    processBillNumber = json['ProcessBillNumber'];
    dispatchingNumber = json['DispatchingNumber'];
  }

  double? fQtyPass;
  double? fQtyProcessPass;
  double? dayWorkCardPlanQty;
  int? fCardNoReportStatus;
  String? plantBody;
  String? processBillNumber;
  double? dispatchingNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FQtyPass'] = fQtyPass;
    map['FQtyProcessPass'] = fQtyProcessPass;
    map['DayWorkCardPlanQty'] = dayWorkCardPlanQty;
    map['FCardNoReportStatus'] = fCardNoReportStatus;
    map['PlantBody'] = plantBody;
    map['ProcessBillNumber'] = processBillNumber;
    map['DispatchingNumber'] = dispatchingNumber;
    return map;
  }
}

/// ID : 0
/// InterID : 0
/// EntryID : 1
/// OperPlanningEntryFID : 3714871
/// EmpID : 0
/// WorkerCode : "0"
/// WorkerName : ""
/// SourceQty : 1463
/// MustQty : 1463
/// PreSchedulingQty : 0
/// Qty : 1463
/// FinishQty : 0
/// SourceEntryID : 2
/// SourceInterID : 213014
/// SourceEntryFID : 555546
/// ProcessNumber : "YT"
/// ProcessName : "沿条"
/// IsOpen : 1
/// RoutingID : 162132

class WorkCardList {
  WorkCardList({
    this.id,
    this.interID,
    this.entryID,
    this.operPlanningEntryFID,
    this.empID,
    this.workerCode,
    this.workerName,
    this.sourceQty,
    this.mustQty,
    this.preSchedulingQty,
    this.qty,
    this.finishQty,
    this.sourceEntryID,
    this.sourceInterID,
    this.sourceEntryFID,
    this.processNumber,
    this.processName,
    this.isOpen,
    this.routingID,
  });

  WorkCardList.fromJson(dynamic json) {
    id = json['ID'];
    interID = json['InterID'];
    entryID = json['EntryID'];
    operPlanningEntryFID = json['OperPlanningEntryFID'];
    empID = json['EmpID'];
    workerCode = json['WorkerCode'];
    workerName = json['WorkerName'];
    sourceQty = json['SourceQty'];
    mustQty = json['MustQty'];
    preSchedulingQty = json['PreSchedulingQty'];
    qty = json['Qty'];
    finishQty = json['FinishQty'];
    sourceEntryID = json['SourceEntryID'];
    sourceInterID = json['SourceInterID'];
    sourceEntryFID = json['SourceEntryFID'];
    processNumber = json['ProcessNumber'];
    processName = json['ProcessName'];
    isOpen = json['IsOpen'];
    routingID = json['RoutingID'];
  }

  int? id;
  int? interID;
  int? entryID;
  int? operPlanningEntryFID;
  int? empID;
  String? workerCode;
  String? workerName;
  double? sourceQty;
  double? mustQty;
  double? preSchedulingQty;
  double? qty;
  double? finishQty;
  int? sourceEntryID;
  int? sourceInterID;
  int? sourceEntryFID;
  String? processNumber;
  String? processName;
  int? isOpen;
  int? routingID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['InterID'] = interID;
    map['EntryID'] = entryID;
    map['OperPlanningEntryFID'] = operPlanningEntryFID;
    map['EmpID'] = empID;
    map['WorkerCode'] = workerCode;
    map['WorkerName'] = workerName;
    map['SourceQty'] = sourceQty;
    map['MustQty'] = mustQty;
    map['PreSchedulingQty'] = preSchedulingQty;
    map['Qty'] = qty;
    map['FinishQty'] = finishQty;
    map['SourceEntryID'] = sourceEntryID;
    map['SourceInterID'] = sourceInterID;
    map['SourceEntryFID'] = sourceEntryFID;
    map['ProcessNumber'] = processNumber;
    map['ProcessName'] = processName;
    map['IsOpen'] = isOpen;
    map['RoutingID'] = routingID;
    return map;
  }
}
