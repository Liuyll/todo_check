import 'package:flutter/material.dart';
import 'dart:developer';

class TaskAddInput extends StatefulWidget {
  Function(String) handleInputDone;

  @override
  State<TaskAddInput> createState() => new TaskAddInputState(handleInputDone);

  TaskAddInput(this.handleInputDone) {}
}

class TaskAddInputState extends State<TaskAddInput> {
  final _controller = new TextEditingController();
  Function(String) handleInputDone;

  TaskAddInputState(this.handleInputDone) {
    _controller.addListener(_handleChange);
  }

  void _handleChange() {

  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
            child: Focus(
              child: new TextField(
                controller: _controller,
              ),
              onFocusChange: (hasFocus) {
                if(!hasFocus) {
                  handleInputDone(_controller.text);
                }
              },
            )
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}