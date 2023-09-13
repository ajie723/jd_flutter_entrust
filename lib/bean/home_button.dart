import '../route.dart';

abstract class ButtonItem {
  late String name;
  late String description;
  late String icon;
  late int classify;

  ButtonItem({
    required this.name,
    required this.description,
    required this.icon,
    required this.classify,
  });
}

class HomeButton extends ButtonItem {
  late int id;
  late int version;
  late String route;
  late String jid;
  bool lock = false;
  bool hasUpdate = false;

  HomeButton({
    required super.name,
    required super.description,
    required super.classify,
    required super.icon,
    required this.id,
    required this.version,
    required this.route,
    required this.jid,
  });
}

class HomeButtonGroup extends ButtonItem {
  List<HomeButton> functionGroup;

  HomeButtonGroup({
    required super.name,
    required super.description,
    required super.icon,
    required super.classify,
    required this.functionGroup,
  });
}

List<ButtonItem> appButtonList = <ButtonItem>[
  ...productionButton,
  ...warehouseButton,
  ...manageButton
];

///生产类功能列表 classify = 0
List<ButtonItem> productionButton = <ButtonItem>[
  HomeButtonGroup(
    name: '派工',
    description: '车间生产派工',
    classify: 0,
    icon: 'lib/res/images/ic_logo.png',
    functionGroup: [
      HomeButton(
          name: '工单列表',
          description: '根据工票生成条码并打印条码',
          classify: 0,
          id: 59,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '生产派工',
          description: 'MES生产派工单列表APP端',
          classify: 0,
          id: 9,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1051101'),
      HomeButton(
          name: '材料车间派工',
          description: '贴合、抽条报工',
          classify: 0,
          id: 10,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '裁断车间工单列表',
          description: '',
          classify: 0,
          id: 89,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '机台派工单',
          description: '圆盘机派工单',
          classify: 0,
          id: 65,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '机台模具派工单列表',
          description: '',
          classify: 0,
          id: 18,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
    ],
  ),
  HomeButtonGroup(
    name: '报工',
    description: '车间生产报表',
    icon: 'lib/res/images/ic_logo.png',
    classify: 0,
    functionGroup: [
      HomeButton(
          name: '车间计工',
          description: '金灿车间报个件、团件',
          classify: 0,
          id: 15,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '湿印工序派工',
          description: '湿印车间打条码、报工',
          classify: 0,
          id: 58,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '部件工序扫描',
          description: '',
          classify: 0,
          id: 60,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '生产部件交接单',
          description: '',
          classify: 0,
          id: 62,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '报工交接确认列表',
          description: '金臻注塑车间报工交接',
          classify: 0,
          id: 67,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '注塑车间扫码报工',
          description: '金臻注塑车间扫码报工',
          classify: 0,
          id: 76,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '部件报工扫描',
          description: '激光裁断报工',
          classify: 0,
          id: 86,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '工序派工单列表',
          description: '裁断一体机生成条码并打印条码',
          classify: 0,
          id: 90,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '工序汇报',
          description: '工票扫码报工',
          classify: 0,
          id: 11,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '成型后段扫码',
          description: '成型线与仓库交接并入库',
          classify: 0,
          id: 2,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050101'),
      HomeButton(
          name: '成型条码采集',
          description: '生产线报工',
          classify: 0,
          id: 1,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050401'),
      HomeButton(
          name: '个件列表',
          description: '个件报工审批',
          classify: 0,
          id: 16,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '部件报工或取消',
          description: '按部件扫码报工旧版',
          classify: 0,
          id: 61,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '品质管理',
          description: '针车品质输入合格数',
          classify: 0,
          id: 23,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1051401'),
    ],
  ),
  HomeButtonGroup(
    name: '报表',
    description: '报表',
    icon: 'lib/res/images/ic_logo.png',
    classify: 0,
    functionGroup: [
      HomeButton(
          name: '供应商合格率报表',
          description: '近2年无使用记录',
          classify: 0,
          id: 44,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1051701'),
      HomeButton(
          name: '供应商质量分析表',
          description: '近2年无使用记录',
          classify: 0,
          id: 45,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1051701'),
      HomeButton(
          name: '战情室扫码查询',
          description: '近2年无使用记录',
          classify: 0,
          id: 47,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '扫码日产量报表',
          description: '',
          classify: 0,
          id: 46,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: RouteConfig.dailyReport,
          jid: '1051101'),
      HomeButton(
          name: '车间产量实时汇总表',
          description: '',
          classify: 0,
          id: 40,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: RouteConfig.productionSummaryTable,
          jid: '1051701'),
      HomeButton(
          name: '生产日报表',
          description: '针车平板中查看日产量报表',
          classify: 0,
          id: 42,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: RouteConfig.productionDayReport,
          jid: '1051701'),
      HomeButton(
          name: '车间生产日报表',
          description: '针车平板中查看日产量报表',
          classify: 0,
          id: 41,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1051701'),
      HomeButton(
          name: '生产效率表',
          description: '针车平板中查看日产量报表',
          classify: 0,
          id: 43,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1051701'),
      HomeButton(
          name: '生产订单用料表',
          description: '查工单组件领料情况',
          classify: 0,
          id: 33,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '查看指令明细',
          description: '查看指令表',
          classify: 0,
          id: 13,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '员工计件产量查询',
          description: '',
          classify: 0,
          id: 17,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '员工计件明细',
          description: '员工产量明细',
          classify: 0,
          id: 12,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '303100101'),
      HomeButton(
          name: '查看工艺说明书',
          description: 'PDF工艺书',
          classify: 0,
          id: 14,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
    ],
  ),
];

///仓库类功能列表 classify = 1
List<ButtonItem> warehouseButton = <ButtonItem>[
  HomeButtonGroup(
    name: 'MES入库',
    description: 'MES入库',
    classify: 2,
    icon: 'lib/res/images/ic_logo.png',
    functionGroup: [
      HomeButton(
          name: '供应商扫码入库',
          description: '采购标扫码入库',
          classify: 1,
          id: 3,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050301'),
      HomeButton(
          name: '生产扫码入库',
          description: 'PP01入库',
          classify: 1,
          id: 4,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050201'),
      HomeButton(
          name: '工序汇报入库',
          description: 'PP03报工入库',
          classify: 1,
          id: 7,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050701'),
      HomeButton(
          name: '送货单列表',
          description: '仓库平板中生成暂收单',
          classify: 1,
          id: 24,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105180104'),
      HomeButton(
          name: '采购订单入库',
          description: '仓库平板中直接根据采购订单入库',
          classify: 1,
          id: 63,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105180104'),
      HomeButton(
          name: '仓库暂收单',
          description: '平板中查看暂收单，生成品检单',
          classify: 1,
          id: 25,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105180204'),
      HomeButton(
          name: '品检单列表',
          description: '平板中查看品检单、仓库入库',
          classify: 1,
          id: 27,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105180504'),
      HomeButton(
          name: '取件码入库',
          description: '',
          classify: 1,
          id: 26,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '采购入库单列表',
          description: '查平板中的入库单',
          classify: 1,
          id: 28,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105180404'),
      HomeButton(
          name: '生产待入库列表',
          description: '',
          classify: 1,
          id: 30,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '采购订单凭证表',
          description: '',
          classify: 1,
          id: 79,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105180104'),
      HomeButton(
          name: '来料稽查',
          description: '稽查单',
          classify: 1,
          id: 22,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1051001'),
    ],
  ),
  HomeButtonGroup(
    name: 'SAP入库',
    description: 'SAP入库',
    classify: 1,
    icon: 'lib/res/images/ic_logo.png',
    functionGroup: [
      HomeButton(
          name: 'SAP采购入库',
          description: '金臻采购物料PDA入库',
          classify: 1,
          id: 71,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP无标入库',
          description: '金臻无标入库',
          classify: 1,
          id: 73,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP注塑入库',
          description: '圆盘机注塑大底扫码入库',
          classify: 1,
          id: 68,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP料头入库',
          description: '金臻料头仓一体机扫码入库',
          classify: 1,
          id: 75,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '成型扫码入库',
          description: '成品鞋入库，委外自动收货',
          classify: 1,
          id: 56,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050102'),
      HomeButton(
          name: 'SAP生产入库',
          description: '金帝内部供应商的成品鞋入库',
          classify: 1,
          id: 81,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP采购入库',
          description: '金帝内部供应商的成品鞋入库',
          classify: 1,
          id: 82,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP领料入库冲销',
          description: '金臻无标冲销',
          classify: 1,
          id: 74,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP贴标上架',
          description: 'WMS仓上架',
          classify: 1,
          id: 77,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
    ],
  ),
  HomeButtonGroup(
    name: 'MES出库',
    description: 'MES出库',
    classify: 1,
    icon: 'lib/res/images/ic_logo.png',
    functionGroup: [
      HomeButton(
          name: '销售扫码出库',
          description: '成品仓库出库',
          classify: 1,
          id: 8,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '生产扫码领料',
          description: '',
          classify: 1,
          id: 5,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050201'),
      HomeButton(
          name: '扫码领料出库',
          description: '',
          classify: 1,
          id: 80,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '领料出库',
          description: '拣货领料，有库位',
          classify: 1,
          id: 19,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1052401'),
      HomeButton(
          name: '待领料列表',
          description: '平板无纸化出库',
          classify: 1,
          id: 29,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '领料冲销',
          description: '无纸化领料后冲销',
          classify: 1,
          id: 34,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1052401'),
      HomeButton(
          name: '成型装箱扫码',
          description: '货柜出货使用',
          classify: 1,
          id: 36,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
    ],
  ),
  HomeButtonGroup(
    name: 'SAP出库',
    description: 'SAP出库',
    classify: 1,
    icon: 'lib/res/images/ic_logo.png',
    functionGroup: [
      HomeButton(
          name: 'SAP生产领料',
          description: '金臻无标领料',
          classify: 1,
          id: 72,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP移库领料',
          description: '',
          classify: 1,
          id: 91,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP喷漆领料',
          description: '金臻喷漆领半成品大底',
          classify: 1,
          id: 66,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP销售出库',
          description: '金臻成品大底扫码销售出库',
          classify: 1,
          id: 70,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP销售出库',
          description: '金帝内部供应商的成品鞋出库',
          classify: 1,
          id: 83,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
    ],
  ),
  HomeButtonGroup(
    name: '仓库管理',
    description: '仓库管理',
    classify: 1,
    icon: 'lib/res/images/ic_logo.png',
    functionGroup: [
      HomeButton(
          name: 'SAP贴标拆分',
          description: '',
          classify: 1,
          id: 92,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '仓库调拨',
          description: '中底成品仓调拨到中仓',
          classify: 1,
          id: 20,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050601'),
      HomeButton(
          name: '交接单列表',
          description: '',
          classify: 1,
          id: 21,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '1050102'),
      HomeButton(
          name: '成品分拣',
          description: '',
          classify: 1,
          id: 39,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP移库',
          description: '金臻注塑拌成品拣货移库',
          classify: 1,
          id: 78,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP贴标重打',
          description: '金臻注塑半成品库，拣货后生新打标',
          classify: 1,
          id: 69,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP扫码盘点',
          description: '金臻仓库盘点',
          classify: 1,
          id: 85,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP计数盘点',
          description: '金臻的无标盘点',
          classify: 1,
          id: 88,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '移库',
          description: '指令物料及货位移库',
          classify: 1,
          id: 35,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: 'SAP成品移库',
          description: '',
          classify: 1,
          id: 84,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '即时库存查询',
          description: '查面料库存及手输的货位',
          classify: 1,
          id: 31,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
      HomeButton(
          name: '物料收发明细',
          description: '仓库物料收发明细',
          classify: 1,
          id: 32,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: ''),
    ],
  ),
];

///管理类功能列表 classify = 2
List<ButtonItem> manageButton = <ButtonItem>[
  HomeButton(
      name: '财产管理',
      description: '财产验收',
      classify: 2,
      id: 49,
      version: 1,
      icon: 'lib/res/images/ic_logo.png',
      route: '',
      jid: '1050901'),
  HomeButton(
      name: '设备维修记录',
      description: '扫码设备财产二维码查询维修记录',
      classify: 2,
      id: 55,
      version: 1,
      icon: 'lib/res/images/ic_logo.png',
      route: '',
      jid: '705080101'),
  HomeButtonGroup(
    name: '宿舍管理',
    description: '集团宿舍管理',
    classify: 2,
    icon: 'lib/res/images/ic_logo.png',
    functionGroup: [
      HomeButton(
          name: '水电抄度',
          description: '宿管抄水电表',
          classify: 2,
          id: 48,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105190104'),
      HomeButton(
          name: '门禁健康认证',
          description: '',
          classify: 2,
          id: 50,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105210101'),
      HomeButton(
          name: '人力资源健康认证',
          description: '',
          classify: 2,
          id: 51,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105210102'),
      HomeButton(
          name: '根据楼层或组别测量体温',
          description: '',
          classify: 2,
          id: 52,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105210104'),
      HomeButton(
          name: '体温测量',
          description: '',
          classify: 2,
          id: 53,
          version: 1,
          icon: 'lib/res/images/ic_logo.png',
          route: '',
          jid: '105210103'),
    ],
  ),
  HomeButton(
      name: '来访登记',
      description: '门卫登记来访人员，来防车辆',
      classify: 2,
      id: 54,
      version: 1,
      icon: 'lib/res/images/ic_logo.png',
      route: '',
      jid: '3072501'),
  HomeButton(
      name: '客户订单详细信息',
      description: '',
      classify: 2,
      id: 57,
      version: 1,
      icon: 'lib/res/images/ic_logo.png',
      route: '',
      jid: ''),
  HomeButton(
      name: '立库货载注册',
      description: '',
      classify: 2,
      id: 37,
      version: 1,
      icon: 'lib/res/images/ic_logo.png',
      route: '',
      jid: ''),
  HomeButton(
      name: '加工商备料',
      description: '',
      classify: 2,
      id: 38,
      version: 1,
      icon: 'lib/res/images/ic_logo.png',
      route: '',
      jid: ''),
  HomeButton(
      name: 'PUMA防伪标管理',
      description: '',
      classify: 2,
      id: 93,
      version: 1,
      icon: 'lib/res/images/ic_logo.png',
      route: '',
      jid: ''),
];
