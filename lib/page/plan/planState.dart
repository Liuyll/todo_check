import 'package:flutter/material.dart';
import 'package:task_check/component/main/TaskAddInput.dart';
import 'package:task_check/component/plan/planItem.dart';
import 'package:task_check/component/plan/planList.dart';
import 'package:task_check/page/plan/plan.dart';
import 'dart:developer';

class PlanDetailPageState extends State<PlanDetailPage> {
  List<Map> data_list;
  bool _shouldShowInput = false;

  PlanDetailPageState(): data_list = new List<Map>() {
    for(var i = 0; i < 10; i++) {
      final data_item = new Map();
      data_item['task'] = '和吴冬: ${i}约会1111111111111发顺丰所说的范德萨';

      data_list.add(data_item);
    }
    final extra_item = new Map();
    extra_item['extra'] = 'ok';
    data_list.add(extra_item);
  }

  initDataFromPageInfo(Object _pageInfo) {
    Map<String, String> pageInfo = (_pageInfo as Map<String, String>);
    // var id = pageInfo['planId'];
  }

  @override
  Widget build(BuildContext context) {
    var pageArgs = ModalRoute.of(context).settings.arguments;
    initDataFromPageInfo(pageArgs);

    return Scaffold(
      body: SafeArea(
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Stack(
              children: [
                Container(
                  child: Image.network(
                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202007%2F08%2F20200708134019_2BNkB.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656321563&t=55552c61e40e3b1a76ad0e95e905949e',
                    fit: BoxFit.fitWidth,
                  ),
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  child: Text(
                    "当前",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 36,
                    ),
                  ),
                  left: 20,
                  top: 20,
                )
              ],
            ),
            PlanList(data_list)
          ],
        ),
      )
    );
  }
}