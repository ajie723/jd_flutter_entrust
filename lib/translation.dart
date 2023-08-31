import 'package:get/get.dart';
import 'package:jd_flutter/utils.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        localeChinese.toString(): {
          'app_name': '金帝集团',
          'key_board_done': '完成',
          'json_format_error': '数据解析异常',
          'dialog_default_title_information': '温馨提示',
          'dialog_default_title_success': '操作成功',
          'dialog_default_title_error': '错误提示',
          'dialog_default_tip_loading': '正在加载...',
          'dialog_default_confirm': '确定',
          'dialog_default_got_it': '知道了',
          'dialog_default_cancel': '取消',
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
          'phone_login_getting_verify_code': '正在发送验证码...',
          'phone_login_get_verify_code_success': '验证码发送成功',
          'phone_login_get_verify_code_failed': '验证码发送失败',
          'face_login_no_camera_permission': '没有相机权限',
          'face_login_failed': '启动人脸识别失败',
          'face_login_getting_photo_path': '正在获取照片信息...',
          'face_login_get_photo_path_failed': '获取照片信息失败',
          'home_top_search': '快速查找功能',
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
          'phone_login_getting_verify_code': 'Sending verify code...',
          'phone_login_get_verify_code_success':
              'Verify code sent successfully',
          'phone_login_get_verify_code_failed': 'Verify code sending failed',
          'face_login_no_camera_permission': 'No camera permissions',
          'face_login_failed': 'Failed to start facial recognition',
          'face_login_getting_photo_path': 'Getting photo information...',
          'face_login_get_photo_path_failed': 'Get photo information failed',
          'home_top_search': 'Quick search function',
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
        }
      };
}
