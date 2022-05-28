import 'package:flutter/material.dart';
import 'package:task_check/component/general/dragItem/dragItemState.dart';

class DragItem extends StatefulWidget {
  Widget child;
  void Function() clickHandler;
  void Function() dragHandler;
  DragItem(this.child, {this.clickHandler, this.dragHandler});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DragItemState(
      child,
      this.clickHandler ?? () {},
      this.dragHandler ?? () {},
    );
  }
}