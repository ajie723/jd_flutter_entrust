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
          'dialog_reason_hint': '请输入原因',
          'dialog_reason_submit': '保存',
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
          'home_user_setting_avatar_photo_sheet_message': '请选择图片来源',
          'home_user_setting_avatar_photo_sheet_take_photo': '拍照',
          'home_user_setting_avatar_photo_sheet_select_photo': '相册',
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
          'page_daily_report_title': '扫码日产量报表',
          'page_daily_report_querying': '正在查询日产量报表...',
          'page_daily_report_table_title_hint1': '物料名称',
          'page_daily_report_table_title_hint2': '尺码',
          'page_daily_report_table_title_hint3': '工序',
          'page_daily_report_table_title_hint4': '报工数',
          'page_production_day_report_title': '日生产报表',
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
          'production_summary_report_title': '产量汇总表',
          'production_summary_report_querying': '正在查询产量实时汇总报表...',
          'production_summary_report_table_title_hint1': '车间地点',
          'production_summary_report_table_title_hint2': '组别',
          'production_summary_report_table_title_hint3': '带线干部',
          'production_summary_report_table_title_hint4': '今日目标产量',
          'production_summary_report_table_title_hint5': '今日产量',
          'production_summary_report_table_title_hint6': '完成率',
          'production_summary_report_table_title_hint7': '月累计目标产量',
          'production_summary_report_table_title_hint8': '月累计产量',
          'production_summary_report_table_title_hint9': '月完成率',
          'production_summary_report_table_title_hint10': '实际人数',
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
          'dialog_reason_hint': 'Please enter the reason',
          'dialog_reason_submit': 'Save',
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
          'home_user_setting_avatar_photo_sheet_message':
              'Please select the image source',
          'home_user_setting_avatar_photo_sheet_take_photo': 'Take photo',
          'home_user_setting_avatar_photo_sheet_select_photo':
              'Select from album',
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
          'page_daily_report_title': 'Scan Daily Production Report',
          'page_daily_report_querying': 'Querying daily production report...',
          'page_daily_report_table_title_hint1': 'Material Name',
          'page_daily_report_table_title_hint2': 'Size',
          'page_daily_report_table_title_hint3': 'Working procedure',
          'page_daily_report_table_title_hint4': 'Quantity',
          'page_production_day_report_title': 'Daily production report',
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
          'production_summary_report_title': 'Production Summary Report',
          'production_summary_report_querying':
              'Querying real-time production summary report...',
          'production_summary_report_table_title_hint1': 'Workshop',
          'production_summary_report_table_title_hint2': 'Group',
          'production_summary_report_table_title_hint3': 'Cadres',
          'production_summary_report_table_title_hint4':
              'Today target production',
          'production_summary_report_table_title_hint5': 'Today production',
          'production_summary_report_table_title_hint6': 'Completion rate',
          'production_summary_report_table_title_hint7':
              'Monthly target production',
          'production_summary_report_table_title_hint8':
              'Monthly cumulative output',
          'production_summary_report_table_title_hint9':
              'Monthly cumulative rate',
          'production_summary_report_table_title_hint10': 'Actual workers',
        }
      };
}
