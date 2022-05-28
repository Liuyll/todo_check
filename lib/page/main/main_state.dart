import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:task_check/component/general/itemRender/itemRender.dart';

class MainPageState extends State{
  ListView dataList;

  Future mainPlanFetch(List<Map> dataList) {
    return Future.delayed(const Duration(seconds: 2), () {
      log("finish");
      for(var i = 0; i < 10; i++) {
        Map data_item = new Map();
        data_item['task'] = '我的: ${i}计划';

        dataList.add(data_item);
      }

      final extra_item = new Map();
      extra_item['extra'] = 'ok';
      dataList.add(extra_item);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return ItemRender(mainPlanFetch);
  }
}

