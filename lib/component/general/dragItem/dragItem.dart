import 'package:flutter/material.dart';
import 'package:task_check/component/general/dragItem/dragItemState.dart';

class DragItem extends StatefulWidget {
  Widget child;
  DragItem(this.child);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DragItemState(
      child
    );
  }
}