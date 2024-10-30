import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_widget.dart';
import 'home_logic.dart';
import 'home_setting_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;
  var list = <String>['采购订单查询', '贴标扫码报工'];

  _appBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.email_outlined,
          color: Colors.blueAccent,
        ),
        onPressed: () => showSnackBar(
          title: '消息中心',
          message: '进入消息中心',
        ),
      ),
      title: CupertinoSearchTextField(
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
        ),
        placeholder: 'home_top_search'.tr,
        onChanged: (v) => {},
      ),
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
            icon: const Hero(tag: 'user', child: Icon(Icons.person)),
            onPressed: () => Get.to(() => const UserSetting())),
      ],
    );
  }

  _item(String name,int index) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      color: Colors.blue[200],
      child: InkWell(child: Center(child: Text(name,style: const TextStyle(color: Colors.white,fontSize: 30),)),onTap: (){
        logic.goPage(index);
      },),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundColor,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appBar(),
          body: ListView.builder(
            padding: const EdgeInsets.all(3),
            itemExtent: 80,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) =>
                _item(list[index],index),
          )),
    );
  }
}
