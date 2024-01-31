import 'package:get/get.dart';
import 'package:jd_flutter/utils.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        localeChinese.toString(): {
          'app_name': '金帝集团',
          'bluetooth_connecting': '正在连接蓝牙...',
          'bluetooth_connect_error_type1': '连接失败',
          'bluetooth_connect_error_type2': '未找到设备',
          'bluetooth_connect_error_type3': '创建通道失败',
          'bluetooth_close_error': '断开失败',
          'bluetooth_no_device': '设备不支持蓝牙',
          'bluetooth_no_permission': '权限被拒绝',
          'bluetooth_open_device': '蓝牙打开',
          'bluetooth_close_device': '蓝牙关闭',
          'bluetooth_connected': '(已配对)',
          'bluetooth_disconnect': '断开链接',
          'bluetooth_connect': '链接',
          'bluetooth_back': '返回',
          'bluetooth_stop': '停止',
          'bluetooth_scan': '扫描',
          'key_board_done': '完成',
          'json_format_error': '数据解析异常',
          'dialog_default_title_information': '温馨提示',
          'dialog_default_title_success': '操作成功',
          'dialog_default_title_error': '错误提示',
          'dialog_default_tip_loading': '正在加载...',
          'dialog_default_confirm': '确定',
          'dialog_default_got_it': '知道了',
          'dialog_default_cancel': '取消',
          'dialog_default_back': '返回',
          'dialog_default_title': '确定吗？',
          'dialog_reason_hint': '请输入原因',
          'dialog_reason_submit': '保存',
          'take_photo_sheet_message': '请选择图片来源',
          'take_photo_photo_sheet_take_photo': '拍照',
          'take_photo_photo_sheet_select_photo': '相册',
          'language': '语言:',
          'login_hint_phone': '手机号',
          'login_hint_machine': '机台号',
          'login_hint_work_number': '工号',
          'login_hint_password': '密码',
          'login_hint_verify_code': '验证码',
          'login_tips_phone': '请输入手机号',
          'login_tips_machine': '请输入机台账号',
          'login_tips_work_number': '请输入工号',
          'login_tips_password': '请输入密码',
          'login_tips_verify_code': '请输入验证码',
          'get_verify_code': '获取验证码',
          'login': '登录',
          'logging': '正在登录...',
          'login_failed': '登录失败',
          're_login': '重新登录',
          'query_default_error': '查询失败',
          'phone_login_getting_verify_code': '正在发送验证码...',
          'phone_login_get_verify_code_success': '验证码发送成功',
          'phone_login_get_verify_code_failed': '验证码发送失败',
          'face_login_no_camera_permission': '没有相机权限',
          'face_login_failed': '启动人脸识别失败',
          'face_login_getting_photo_path': '正在获取照片信息...',
          'face_login_get_photo_path_failed': '获取照片信息失败',
          'home_top_search': '快速查找功能',
          'home_getting_function_list': '正在获取功能列表...',
          'home_button_no_permission': '无权限',
          'home_button_has_update': '新版本',
          'home_bottom_bar_produce': '生产',
          'home_bottom_bar_warehouse': '仓库',
          'home_bottom_bar_manage': '管理',
          'home_user_setting_logout': '注销',
          'home_user_setting_password_change': '修改密码',
          'home_user_setting_check_version': '检查更新',
          'is_already_latest_version': '当前版本已是最新版本',
          'home_user_setting_factory': '工厂:',
          'home_user_setting_department': '部门:',
          'home_user_setting_position': '职位:',
          'home_user_setting_avatar_photo_sheet_title': '更换头像',
          'cropper_title': '裁剪图片',
          'cropper_cancel': '取消',
          'cropper_confirm': '确定',
          'home_user_setting_avatar_photo_submitting': '正在提交照片...',
          'change_password_dialog_title': '修改密码',
          'change_password_dialog_old_password': '请输入原密码',
          'change_password_dialog_old_password_error': '原密码错误',
          'change_password_dialog_new_password': '请输入新密码',
          'change_password_dialog_submit': '修改',
          'change_password_dialog_submitting': '密码修改中...',
          'getting_group': '正在获取部门组别信息...',
          'modifying_group': '正在修改组别信息...',
          'checking_version': '正在检查版本...',
          'update_dialog_title': '发现新版本',
          'update_dialog_confirm': '立即更新',
          'update_dialog_cancel': '忽略更新',
          'picker_search': '输入名称快速定位',
          'picker_loading': '加载中...',
          'picker_refresh': '刷新',
          'picker_type_sap_supplier': 'SAP供应商',
          'picker_type_sap_company': 'SAP公司',
          'picker_type_sap_factory': 'SAP厂区',
          'picker_type_sap_work_center': 'SAP工作中心',
          'picker_type_sap_department': 'SAP部门',
          'picker_type_sap_process_flow': 'SAP制程',
          'picker_type_sap_machine': 'SAP机台',
          'picker_type_sap_work_center_new': 'SAP工作中心(新)',
          'picker_type_sap_group': 'SAP组别',
          'picker_type_sap_factory_warehouse': 'SAP工厂仓库',
          'picker_type_mes_work_shop': 'MES车间',
          'picker_type_mes_department': 'MES部门',
          'picker_type_mes_organization': 'MES组织',
          'picker_type_mes_process_flow': 'MES制程',
          'picker_type_mes_production_report_type': 'MES报表类型',
          'picker_type_mes_molding_pack_area_report_type': 'MES打包区',
          'picker_type_date': '日期',
          'picker_type_start_date': '起始日期',
          'picker_type_end_date': '截至日期',
          'picker_type_error': '无此类型',
          'spinner_work_shop_hint1': '裁断车间',
          'spinner_work_shop_hint2': '针车车间',
          'spinner_work_shop_hint3': '成型车间',
          'spinner_work_shop_hint4': '印业车间',
          'spinner_work_shop_hint5': '其他',
          'page_title_with_drawer_query': '查询',
          'page_daily_report_querying': '正在查询日产量报表...',
          'page_daily_report_table_title_hint1': '物料名称',
          'page_daily_report_table_title_hint2': '尺码',
          'page_daily_report_table_title_hint3': '工序',
          'page_daily_report_table_title_hint4': '报工数',
          'page_production_day_report_querying': '正在查询产量实时汇总报表...',
          'page_production_day_report_table_title_hint1': '部门名称',
          'page_production_day_report_table_title_hint2': '负责人',
          'page_production_day_report_table_title_hint3': '今日目标产量',
          'page_production_day_report_table_title_hint4': '今日实际产量',
          'page_production_day_report_table_title_hint5': '今日完成率',
          'page_production_day_report_table_title_hint6': '今日未完成产量',
          'page_production_day_report_table_title_hint7': '月目标产量',
          'page_production_day_report_table_title_hint8': '月累计产量',
          'page_production_day_report_table_title_hint9': '月累计达成率',
          'page_production_day_report_table_title_hint10': '月累计未完成产量',
          'page_production_day_report_table_title_hint11': '应到人数',
          'page_production_day_report_table_title_hint12': '实际人数',
          'page_production_day_report_table_title_hint13': '未达成原因分析',
          'page_production_day_report_reason_dialog_hint1': '组别',
          'page_production_day_report_reason_dialog_hint2': '工号',
          'page_production_day_report_reason_dialog_hint3': '姓名',
          'page_production_day_report_reason_dialog_hint4': '职位',
          'page_production_day_report_reason_dialog_error': '每天数据次日9点之后不能修改!',
          'page_production_day_report_reason_dialog_save': '正在保存...',
          'page_production_day_report_reason_dialog_save_error': '保存失败',
          'page_production_summary_report_querying': '正在查询产量实时汇总报表...',
          'page_production_summary_report_table_title_hint1': '车间地点',
          'page_production_summary_report_table_title_hint2': '组别',
          'page_production_summary_report_table_title_hint3': '带线干部',
          'page_production_summary_report_table_title_hint4': '今日目标产量',
          'page_production_summary_report_table_title_hint5': '今日产量',
          'page_production_summary_report_table_title_hint6': '完成率',
          'page_production_summary_report_table_title_hint7': '月累计目标产量',
          'page_production_summary_report_table_title_hint8': '月累计产量',
          'page_production_summary_report_table_title_hint9': '月完成率',
          'page_production_summary_report_table_title_hint10': '实际人数',
          'page_molding_pack_area_report_query_instruction': '请输入销售订单号',
          'page_molding_pack_area_report_query_order_number': '请输入客户订单号',
          'page_molding_pack_area_report_query_type_body': '请输入型体',
          'page_molding_pack_area_report_table_hint1': '线别',
          'page_molding_pack_area_report_table_hint2': '销售订单',
          'page_molding_pack_area_report_table_hint3': '客户订单号',
          'page_molding_pack_area_report_table_hint4': '交期',
          'page_molding_pack_area_report_table_hint5': '型体',
          'page_molding_pack_area_report_table_hint6': '颜色',
          'page_molding_pack_area_report_table_hint7': '订单数(双)',
          'page_molding_pack_area_report_table_hint8': '订单数(件)',
          'page_molding_pack_area_report_table_hint9': '已入包装区数',
          'page_molding_pack_area_report_table_hint10': '未入包装区数',
          'page_molding_pack_area_report_table_hint11': '可配箱数(双)',
          'page_molding_pack_area_report_table_hint12': '可配箱数(件)',
          'page_molding_pack_area_report_table_hint13': '偏码数',
          'page_molding_pack_area_report_table_hint14': 'SAP已过账数(双)',
          'page_molding_pack_area_report_table_hint15': 'SAP已过账数(件)',
          'page_molding_pack_area_report_table_hint16': 'SAP未过账数(双)',
          'page_molding_pack_area_report_table_hint17': 'SAP未过账数(件)',
          'page_molding_pack_area_report_detail_table_hint1': '客户订单号',
          'page_molding_pack_area_report_detail_table_hint2': '行号',
          'page_molding_pack_area_report_detail_table_hint3': '尺码',
          'page_molding_pack_area_report_detail_table_hint4': '订单数(双)',
          'page_molding_pack_area_report_detail_table_hint5': '订单数(件)',
          'page_molding_pack_area_report_detail_table_hint6': '可配箱数(双)',
          'page_molding_pack_area_report_detail_table_hint7': '可配箱数(件)',
          'page_molding_pack_area_report_detail_table_hint8': '偏码数',
          'molding_scan_bulletin_report_table_hint1': '尺码',
          'molding_scan_bulletin_report_table_hint2': '指令数',
          'molding_scan_bulletin_report_table_hint3': '汇报',
          'molding_scan_bulletin_report_table_hint4': '累计',
          'molding_scan_bulletin_report_table_hint5': '欠数',
          'molding_scan_bulletin_report_table_hint6': '完成率',
          'molding_scan_bulletin_report_table_hint7': '合计',
          'molding_scan_bulletin_report_hint1': '工厂型体：',
          'molding_scan_bulletin_report_hint2': '销售订单：',
          'molding_scan_bulletin_report_hint3': '客户单号：',
          'molding_scan_bulletin_report_hint4': '当前组别：',
          'molding_scan_bulletin_report_sort': '工单排序',
          'molding_scan_bulletin_report_querying': '正在查询报表...',
          'molding_scan_bulletin_report_submitting': '正在提交排序...',
          'production_dispatch_instruction_hint': '计划跟踪单号、指令、型体',
          'production_dispatch_query_progress': '查询进度',
          'production_dispatch_query_show_outsourcing': '显示委外',
          'production_dispatch_query_show_close': '显示关闭',
          'production_dispatch_query_many_select': '多选',
          'production_dispatch_query_merge_orders': '合并工单',
          'production_dispatch_bt_material_list': '生产订单用料表',
          'production_dispatch_bt_instruction': '指令表',
          'production_dispatch_bt_color_matching': '配色单列表',
          'production_dispatch_bt_process_instruction': '工艺指导书',
          'production_dispatch_bt_process_open': '打开工序',
          'production_dispatch_bt_process_close': '关闭工序',
          'production_dispatch_bt_delete_downstream': '删除下游工序',
          'production_dispatch_bt_delete_last_report': '删除上一次报工',
          'production_dispatch_bt_label_maintenance': '贴标维护',
          'production_dispatch_bt_update_sap': '更新领料配套数',
          'production_dispatch_bt_print_material_head': '料头打印',
          'production_dispatch_bt_report_sap': '报工SAP',
          'production_dispatch_bt_push': '下推',
          'property_tab_type_1': '已审核',
          'property_tab_type_2': '未审核',
          'property_tab_type_3': '审核中',
          'property_query_et_property_number': '财产编号',
          'property_query_et_property_name': '财产名称',
          'property_query_et_serial_number': '流水号',
          'property_query_et_invoice_number': '发票号',
          'property_query_et_name': '姓名',
          'property_query_et_worker_number': '工号',
          'property_querying': '正在查询财产数据...',
          'property_item_hint': '未查看',
          'property_item_hint1': '发票号:',
          'property_item_hint2': '保管人:',
          'property_item_hint3': '存放点:',
          'property_item_hint4': '打印次数:',
          'property_bt_print': '打印标签',
          'property_print_no_selected': '请勾选要打印的财产！',
          'property_detail_title': '固定财产登记',
          'property_detail_bt_close': '入库确认',
          'property_detail_hint_close': '确定要结案入库吗？',
          'property_detail_closing': '正在提交结案...',
          'property_detail_bt_no_acceptance': '不验收',
          'property_detail_hint_no_acceptance': '确定不验收本单财产吗？',
          'property_detail_skipping_acceptance': '正在跳过验收流程...',
          'property_detail_bt_submit': '发起审核',
          'property_detail_hint_submit': '确定要发起审核吗？',
          'property_detail_submitting': '正在提交审核数据...',
          'property_detail_state1': '未审核',
          'property_detail_state2': '审核中',
          'property_detail_state3': '已审核',
          'property_detail_state4': '工单异常',
          'property_detail_hint1': '流水号:',
          'property_detail_hint2': '发票号:',
          'property_detail_hint3': '编号:',
          'property_detail_hint4': '名称:',
          'property_detail_hint5': '规格型号:',
          'property_detail_hint6': '类别:',
          'property_detail_hint7': '数量:',
          'property_detail_hint8': '单位:',
          'property_detail_hint9': '单价:',
          'property_detail_hint10': '原值:',
          'property_detail_hint11': '供货厂商:',
          'property_detail_hint12': '制造商:',
          'property_detail_hint13': '生产日期:',
          'property_detail_hint14': '购买日期:',
          'property_detail_hint15': '保修期限:',
          'property_detail_hint16': '预计寿命:',
          'property_detail_hint17': '参检人:',
          'property_detail_hint18': '保管人:',
          'property_detail_hint19': '监管人:',
          'property_detail_hint20': '保管日期:',
          'property_detail_hint21': '保管部门:',
          'property_detail_hint22': '登记日:',
          'property_detail_hint23': '存放地点:',
          'property_detail_hint24': '采购凭证:',
          'property_detail_hint25': '备注:',
          'property_detail_photo1': '现场照',
          'property_detail_photo2': '铭牌照',
          'property_detail_item_hint1': '设备:',
          'property_detail_item_hint2': '金额:',
        },
        localeEnglish.toString(): {
          'app_name': 'Gold Emperor',
          'key_board_done': 'Done',
          'json_format_error': 'data format error',
          'dialog_default_title_information': 'Tips',
          'dialog_default_title_success': 'Success',
          'dialog_default_title_error': 'Error',
          'dialog_default_tip_loading': 'Loading...',
          'dialog_default_confirm': 'Confirm',
          'dialog_default_got_it': 'Got it',
          'dialog_default_cancel': 'Cancel',
          'dialog_default_back': 'Back',
          'dialog_default_title': 'Are you sure ？',
          'dialog_reason_hint': 'Please enter the reason',
          'dialog_reason_submit': 'Save',
          'take_photo_sheet_message': 'Please select the image source',
          'take_photo_sheet_take_photo': 'Take photo',
          'take_photo_sheet_select_photo':
          'Select from album',
          'language': 'Language:',
          'login_hint_phone': 'Phone number',
          'login_hint_machine': 'Machine number',
          'login_hint_work_number': 'Work number',
          'login_hint_password': 'Password',
          'login_hint_verify_code': 'verify code',
          'login_tips_phone': 'Please enter your phone number',
          'login_tips_machine': 'Please enter the machine account',
          'login_tips_work_number': 'Please enter the work number',
          'login_tips_password': 'Please enter your password',
          'login_tips_verify_code': 'Please enter your verify code',
          'get_verify_code': 'Get verify',
          'login': 'Login',
          'logging': 'Logging...',
          'login_failed': 'Login failed',
          're_login': 'ReLogin',
          'query_default_error': 'Query failed',
          'phone_login_getting_verify_code': 'Sending verify code...',
          'phone_login_get_verify_code_success':
              'Verify code sent successfully',
          'phone_login_get_verify_code_failed': 'Verify code sending failed',
          'face_login_no_camera_permission': 'No camera permissions',
          'face_login_failed': 'Failed to start facial recognition',
          'face_login_getting_photo_path': 'Getting photo information...',
          'face_login_get_photo_path_failed': 'Get photo information failed',
          'home_top_search': 'Quick search function',
          'home_getting_function_list': 'Getting function list...',
          'home_button_no_permission': 'No permission',
          'home_button_has_update': 'New version',
          'home_bottom_bar_produce': 'Produce',
          'home_bottom_bar_warehouse': 'Warehouse',
          'home_bottom_bar_manage': 'Manage',
          'home_user_setting_logout': 'Logout',
          'home_user_setting_password_change': 'Password change',
          'home_user_setting_check_version': 'Check version',
          'is_already_latest_version':
              'The current version is already the latest version',
          'home_user_setting_factory': 'Factory:',
          'home_user_setting_department': 'Department:',
          'home_user_setting_position': 'Position:',
          'home_user_setting_avatar_photo_sheet_title': 'Change avatar',
          'cropper_title': 'Crop Picture',
          'cropper_cancel': 'Cancel',
          'cropper_confirm': 'Done',
          'home_user_setting_avatar_photo_submitting': 'Photo submitting...',
          'change_password_dialog_title': 'Modify password',
          'change_password_dialog_old_password':
              'Please enter the original password',
          'change_password_dialog_old_password_error':
              'Original password error',
          'change_password_dialog_new_password': 'Please enter a new password',
          'change_password_dialog_submit': 'Modify',
          'change_password_dialog_submitting':
              'Password modification in progress...',
          'getting_group': 'Obtaining department group information...',
          'modifying_group': 'Modifying group...',
          'checking_version': 'Checking version...',
          'update_dialog_title': 'New version',
          'update_dialog_confirm': 'Update Now',
          'update_dialog_cancel': 'Ignore',
          'picker_search': 'Enter a name to quickly locate',
          'picker_loading': 'Loading...',
          'picker_refresh': 'Refresh',
          'picker_type_sap_supplier': 'SAP Supplier',
          'picker_type_sap_company': 'SAP Company',
          'picker_type_sap_factory': 'SAP Factory',
          'picker_type_sap_work_center': 'SAP Work Center',
          'picker_type_sap_department': 'SAP Department',
          'picker_type_sap_process_flow': 'SAP Process Flow',
          'picker_type_sap_machine': 'SAP Machine',
          'picker_type_sap_work_center_new': 'SAP Work Center(New)',
          'picker_type_sap_group': 'SAP Group',
          'picker_type_sap_factory_warehouse': 'SAP Factory Warehouse',
          'picker_type_mes_work_shop': 'MES Work Shop',
          'picker_type_mes_department': 'MES Department',
          'picker_type_mes_organization': 'MES Organization',
          'picker_type_mes_process_flow': 'MES Process Flow',
          'picker_type_mes_production_report_type': 'MES Report Type',
          'picker_type_mes_molding_pack_area_report_type': 'MES Pack area',
          'picker_type_date': 'Date',
          'picker_type_start_date': 'Start date',
          'picker_type_end_date': 'End date',
          'picker_type_error': 'Error Type',
          'spinner_work_shop_hint1': 'Cutting',
          'spinner_work_shop_hint2': 'Needle lathe',
          'spinner_work_shop_hint3': 'Forming',
          'spinner_work_shop_hint4': 'Printing',
          'spinner_work_shop_hint5': 'Other',
          'page_title_with_drawer_query': 'Query',
          'page_daily_report_querying': 'Querying daily production report...',
          'page_daily_report_table_title_hint1': 'Material Name',
          'page_daily_report_table_title_hint2': 'Size',
          'page_daily_report_table_title_hint3': 'Working procedure',
          'page_daily_report_table_title_hint4': 'Quantity',
          'page_production_day_report_querying':
              'Querying real-time production summary report...',
          'page_production_day_report_table_title_hint1': 'Department name',
          'page_production_day_report_table_title_hint2': 'Head',
          'page_production_day_report_table_title_hint3':
              'Today target production',
          'page_production_day_report_table_title_hint4': 'Today production',
          'page_production_day_report_table_title_hint5':
              'Today Completion rate',
          'page_production_day_report_table_title_hint6':
              'Today Incomplete rate',
          'page_production_day_report_table_title_hint7':
              'Monthly target production',
          'page_production_day_report_table_title_hint8':
              'Monthly cumulative output',
          'page_production_day_report_table_title_hint9':
              'Monthly cumulative achievement rate',
          'page_production_day_report_table_title_hint10':
              'Monthly cumulative incomplete rate',
          'page_production_day_report_table_title_hint11': 'Expected workers',
          'page_production_day_report_table_title_hint12': 'Actual workers',
          'page_production_day_report_table_title_hint13': 'Failure analysis',
          'page_production_day_report_reason_dialog_hint1': 'Group',
          'page_production_day_report_reason_dialog_hint2': 'Worker number',
          'page_production_day_report_reason_dialog_hint3': 'Worker Name',
          'page_production_day_report_reason_dialog_hint4': 'Position',
          'page_production_day_report_reason_dialog_error':
              'Daily data cannot be modified after 9:00 am the next day !',
          'page_production_day_report_reason_dialog_save': 'Saving...',
          'page_production_day_report_reason_dialog_save_error': 'Save failed',
          'page_production_summary_report_querying':
              'Querying real-time production summary report...',
          'page_production_summary_report_table_title_hint1': 'Workshop',
          'page_production_summary_report_table_title_hint2': 'Group',
          'page_production_summary_report_table_title_hint3': 'Cadres',
          'page_production_summary_report_table_title_hint4':
              'Today target production',
          'page_production_summary_report_table_title_hint5':
              'Today production',
          'page_production_summary_report_table_title_hint6': 'Completion rate',
          'page_production_summary_report_table_title_hint7':
              'Monthly target production',
          'page_production_summary_report_table_title_hint8':
              'Monthly cumulative output',
          'page_production_summary_report_table_title_hint9':
              'Monthly cumulative rate',
          'page_production_summary_report_table_title_hint10': 'Actual workers',
          'page_molding_pack_area_report_query_instruction':
              'Please enter the instruction',
          'page_molding_pack_area_report_query_order_number':
              'Please enter the purchase order',
          'page_molding_pack_area_report_query_type_body':
              'Please enter the type',
          'page_molding_pack_area_report_table_hint1': 'Line',
          'page_molding_pack_area_report_table_hint2': 'Sales No',
          'page_molding_pack_area_report_table_hint3': 'Customer order',
          'page_molding_pack_area_report_table_hint4': 'Delivery date',
          'page_molding_pack_area_report_table_hint5': 'Type body',
          'page_molding_pack_area_report_table_hint6': 'Color',
          'page_molding_pack_area_report_table_hint7': 'Order qty(Pair)',
          'page_molding_pack_area_report_table_hint8': 'Order qty(Piece)',
          'page_molding_pack_area_report_table_hint9': 'Entered pack area',
          'page_molding_pack_area_report_table_hint10': 'Not enter pack area',
          'page_molding_pack_area_report_table_hint11':
              'Configurable boxes(Pair)',
          'page_molding_pack_area_report_table_hint12':
              'Configurable boxes(Piece)',
          'page_molding_pack_area_report_table_hint13': 'Biased size',
          'page_molding_pack_area_report_table_hint14': 'SAP Posted qty(Pair)',
          'page_molding_pack_area_report_table_hint15': 'SAP Posted qty(Piece)',
          'page_molding_pack_area_report_table_hint16':
              'SAP UnPosted qty(Pair)',
          'page_molding_pack_area_report_table_hint17':
              'SAP UnPosted qty(Piece)',
          'page_molding_pack_area_report_detail_table_hint1': 'Customer order',
          'page_molding_pack_area_report_detail_table_hint2': 'Line No',
          'page_molding_pack_area_report_detail_table_hint3': 'Size',
          'page_molding_pack_area_report_detail_table_hint4': 'Order qty(Pair)',
          'page_molding_pack_area_report_detail_table_hint5':
              'Order qty(Piece)',
          'page_molding_pack_area_report_detail_table_hint6':
              'Configurable boxes(Pair)',
          'page_molding_pack_area_report_detail_table_hint7':
              'Configurable boxes(Piece)',
          'page_molding_pack_area_report_detail_table_hint8': 'Biased size',
          'molding_scan_bulletin_report_table_hint1': 'Size',
          'molding_scan_bulletin_report_table_hint2': 'Instructions',
          'molding_scan_bulletin_report_table_hint3': 'Report',
          'molding_scan_bulletin_report_table_hint4': 'Accumulate',
          'molding_scan_bulletin_report_table_hint5': 'Owe',
          'molding_scan_bulletin_report_table_hint6': 'Completion rate',
          'molding_scan_bulletin_report_table_hint7': 'Total',
          'molding_scan_bulletin_report_hint1': 'Type body:',
          'molding_scan_bulletin_report_hint2': 'Sales No:',
          'molding_scan_bulletin_report_hint3': 'Customer No:',
          'molding_scan_bulletin_report_hint4': 'Department:',
          'molding_scan_bulletin_report_sort': 'Order Sort',
          'molding_scan_bulletin_report_querying': 'Querying report...',
          'molding_scan_bulletin_report_submitting': 'Submitting sorting...',
          'production_dispatch_instruction_hint':
              'Tracking number , instruction , type body',
          'production_dispatch_query_progress': 'Query progress',
          'production_dispatch_query_show_outsourcing': 'Outsourcing',
          'production_dispatch_query_show_close': 'Close',
          'production_dispatch_query_many_select': 'Many select',
          'production_dispatch_query_merge_orders': 'Merge orders',
          'production_dispatch_bt_material_list': 'Materials',
          'production_dispatch_bt_instruction': 'Instructions',
          'production_dispatch_bt_color_matching': 'Color matching',
          'production_dispatch_bt_process_instruction': 'Process instruction',
          'production_dispatch_bt_process_open': 'Process open',
          'production_dispatch_bt_process_close': 'Process close',
          'production_dispatch_bt_delete_downstream': 'Delete downstream',
          'production_dispatch_bt_delete_last_report': 'Delete last report',
          'production_dispatch_bt_label_maintenance': 'Label maintenance',
          'production_dispatch_bt_update_sap': 'Update sap',
          'production_dispatch_bt_print_material_head': 'Print material head',
          'production_dispatch_bt_report_sap': 'Report sap',
          'production_dispatch_bt_push': 'push',
          'property_tab_type_1': 'Audited',
          'property_tab_type_2': 'UnAudited',
          'property_tab_type_3': 'Under Audit',
          'property_query_et_property_number': 'Property Number',
          'property_query_et_property_name': 'Property Name',
          'property_query_et_serial_number': 'Serial Number',
          'property_query_et_invoice_number': 'Invoice Number',
          'property_query_et_name': 'Name',
          'property_query_et_worker_number': 'Worker Number',
          'property_querying': 'Querying property data...',
          'property_item_hint': 'UnView',
          'property_item_hint1': 'Invoice No:',
          'property_item_hint2': 'Custodian:',
          'property_item_hint3': 'Address:',
          'property_item_hint4': 'Printed:',
          'property_bt_print': 'Print Label',
          'property_print_no_selected':
              'Please check the property to be printed !',
          'property_detail_title': 'Property registration',
          'property_detail_bt_close': 'Stock in confirmation',
          'property_detail_hint_close': 'Are you sure to close the case and enter it into the database ?',
          'property_detail_closing': 'Submitting the closing...',
          'property_detail_bt_no_acceptance': 'No acceptance',
          'property_detail_hint_no_acceptance': 'Are you sure not to accept the property on this order ?',
          'property_detail_skipping_acceptance': 'Skipping the acceptance process...',
          'property_detail_bt_submit': 'Initiate review',
          'property_detail_hint_submit': 'Are you sure to initiate the audit ?',
          'property_detail_submitting': 'Submitting audit data...',
          'property_detail_state1': 'UnReview',
          'property_detail_state2': 'Reviewing',
          'property_detail_state3': 'Reviewed',
          'property_detail_state4': 'Order error',
          'property_detail_hint1': 'Serial No:',
          'property_detail_hint2': 'Invoice No:',
          'property_detail_hint3': 'Number:',
          'property_detail_hint4': 'Name:',
          'property_detail_hint5': 'Models:',
          'property_detail_hint6': 'Type::',
          'property_detail_hint7': 'Quantity:',
          'property_detail_hint8': 'Unit:',
          'property_detail_hint9': 'Price:',
          'property_detail_hint10': 'Original:',
          'property_detail_hint11': 'Suppliers:',
          'property_detail_hint12': 'Manufacturer:',
          'property_detail_hint13': 'Produce date:',
          'property_detail_hint14': 'Buy date:',
          'property_detail_hint15': 'Warranty period:',
          'property_detail_hint16': 'Life expectancy:',
          'property_detail_hint17': 'Participator:',
          'property_detail_hint18': 'Custodian:',
          'property_detail_hint19': 'Supervisor:',
          'property_detail_hint20': 'Storage date:',
          'property_detail_hint21': 'Custody department:',
          'property_detail_hint22': 'Registration date:',
          'property_detail_hint23': 'Address:',
          'property_detail_hint24': 'Purchasing No:',
          'property_detail_hint25': 'Remarks:',
          'property_detail_photo1': 'On-site photos',
          'property_detail_photo2': 'Nameplate',
          'property_detail_item_hint1': 'Device:',
          'property_detail_item_hint2': 'Amount:',
        }
      };
}
