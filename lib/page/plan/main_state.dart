import 'package:flutter/material.dart';
import 'package:task_check/component/main/TaskAddInput.dart';
import 'package:task_check/page/plan/main.dart';
import 'dart:developer';

class PlanDetailPageState extends State<PlanDetailPage> {
  List<Map> data_list;
  bool _shouldShowInput = false;

  PlanDetailPageState(): data_list = new List<Map>() {
    for(var i = 0; i < 10; i++) {
      final data_item = new Map();
      data_item['task'] = '和吴冬: ${i}约会';

      data_list.add(data_item);
    }
    final extra_item = new Map();
    extra_item['extra'] = 'ok';
    data_list.add(extra_item);
  }

  handleAddInput() {
    setState(() {
      _shouldShowInput = true;
    });
  }

  handleInputDone(String newValue) {
    setState(() {
      data_list.insert(data_list.length - 1, Map.fromEntries([MapEntry('task', newValue)]));
      _shouldShowInput = false;
    });
  }

  initDataFromPageInfo(Object _pageInfo) {
    Map<String, String> pageInfo = (_pageInfo as Map<String, String>);
    var id = pageInfo['planId'];
  }

  @override
  Widget build(BuildContext context) {
    var pageArgs = ModalRoute.of(context).settings.arguments;
    initDataFromPageInfo(pageArgs);

    return Scaffold(
      body: new ListView.builder(
          itemCount: data_list.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 5, top: 5, right: 5),
              child: data_list[index]['extra'] == null ? Text(data_list[index]['task']) : Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    (_shouldShowInput == true) ? TaskAddInput(handleInputDone) : GestureDetector(
                        onTap: () { handleAddInput(); },
                        child: Container(
                          color: Colors.red,
                          child: Icon(
                              Icons.add
                          ),
                        )
                    )
                  ],
                ),
              )
            );
          }
      ),
    );
  }
}