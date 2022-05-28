import 'package:flutter/material.dart';
import 'package:task_check/component/general/addButton/addButton.dart';
import 'package:task_check/component/general/dragItem/dragItem.dart';
import 'package:task_check/component/plan/planItem.dart';

class PlanList extends StatefulWidget {
  List<Map> data_list;
  PlanList(this.data_list);

  @override
  State createState() {
    return PlanListState(this.data_list);
  }
}

class PlanListState extends State {
  List<Map> data_list;
  PlanListState(this.data_list);

  void handleAddDone(String item) {
    setState(() {
      data_list.insert(data_list.length - 1, Map.fromEntries([MapEntry('task', item)]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: data_list.length,
        itemExtent: 55,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.only(left: 5, top: 5, right: 5),
              child: data_list[index]['extra'] == null ? DragItem(
                  PlanItem(data_list[index]['task'])
              ) : Container(
                  child: AddButton(handleAddDone)
              )
          );
        }
    );
  }
}