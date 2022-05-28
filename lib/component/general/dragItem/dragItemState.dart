import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class DragItemState extends State {
  double offset = 0;
  double startX = -1;
  Widget child;
  void Function() clickHandler;
  void Function() dragHandler;

  DragItemState(this.child, this.clickHandler, this.dragHandler);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: this.clickHandler,
            child: child,
          ),
          GestureDetector(
            onHorizontalDragStart: (DragStartDetails e) {
              startX = e.localPosition.dx;
            },
            onHorizontalDragUpdate: (DragUpdateDetails e) {
              var newOffset = startX - e.localPosition.dx;
              if(newOffset > 200) newOffset = 200;

              setState(() {
                offset = newOffset;
              });
            },
            onHorizontalDragEnd: (DragEndDetails e) {
              setState(() {
                offset = offset > 100 ? 200 : 0;
              });

              this.dragHandler();
            },

            child: Container(
              color: Colors.blue,
              width: 200,
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    left: 200 - offset,
                    child: Container(
                      color: Colors.red,
                      width: 200,
                      child: Center(
                        child: const Text("测试"),
                      ),
                    ),
                  )
                ],
              ),
            ) ,
          )
        ],
      ),
    );
  }
}