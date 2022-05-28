import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_check/component/plan/planContent.dart';

class PlanItem extends StatefulWidget {
  String text;
  PlanItem(this.text);

  createState() => PlanItemState(this.text);
}

class PlanItemState extends State {
  String text;
  bool hasFinish = false;

  PlanItemState(this.text);

  Widget finishButtonBuilder(BuildContext context, StateSetter setState) {
    return GestureDetector(
      onTap: () {
        setState(() {
          hasFinish = !hasFinish;
        });
      },
      child: Image(
        image: AssetImage('assets/icons/' + (hasFinish ? 'has_finish.png' : 'not_finish.png')),
        width: 18,
        height: 18,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          StatefulBuilder(builder: finishButtonBuilder),
          PlanContent(this.text, '测试时间'),
        ],
      ),
      height: 50,
    );
  }
}