import 'dart:developer' as developer;
import 'dart:math';
import 'package:flutter/material.dart';

class DragItemState extends State {
  double offset = 0;
  double startX = -1;
  double leftChildMoveOffset = 0;
  Widget child;
  void Function() clickHandler;
  void Function() dragHandler;

  DragItemState(this.child, this.clickHandler, this.dragHandler);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Stack(
        children: [
          Positioned(
            child: GestureDetector(
              onTap: this.clickHandler,
              child: child,
              // child: Text("测试"),
            ),
            right: 0,
            left: leftChildMoveOffset,
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onHorizontalDragStart: (DragStartDetails e) {
                startX = e.localPosition.dx;
              },
              onHorizontalDragUpdate: (DragUpdateDetails e) {
                var newOffset = startX - e.localPosition.dx;
                if(newOffset > 200) newOffset = 200;

                setState(() {
                  offset = newOffset;
                  leftChildMoveOffset = min(-newOffset, 0);
                });
              },
              onHorizontalDragEnd: (DragEndDetails e) {
                setState(() {
                  offset = offset > 100 ? 200 : 0;
                });

                this.dragHandler();
              },
              onTap: () {
                developer.log("fucl");
              },

              child: Container(
                color: Color.fromARGB(10, 1, 221, 35),
                width: 200,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      left: 200 - offset,
                      child: Container(
                        color: Colors.red,
                        width: 200,
                        height: 40,
                        child: Center(
                          child: const Text("测试"),
                        ),
                      ),
                    )
                  ],
                ),
              ) ,
            ),
          )
        ],
      )
    );
  }
}