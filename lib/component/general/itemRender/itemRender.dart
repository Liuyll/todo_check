import 'package:flutter/material.dart';
import 'package:task_check/component/general/itemRender/itemRenderState.dart';

class ItemRender extends StatefulWidget {
  Future Function(List<Map>) dataFetch;
  @override
  State<StatefulWidget> createState() {
    return ItemRenderState(dataFetch);
  }

  ItemRender(this.dataFetch);
}