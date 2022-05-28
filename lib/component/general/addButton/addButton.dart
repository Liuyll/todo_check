import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_check/component/main/TaskAddInput.dart';

class AddButton extends StatefulWidget {
  void Function(String) handleInputDone;

  AddButton(this.handleInputDone);

  @override
  State createState() {
    return AddButtonState(this.handleInputDone);
  }
}

class AddButtonState extends State {
  bool _shouldShowInput = false;
  void Function(String) handleInputDone;
  AddButtonState(this.handleInputDone);

  handleAddInput() {
    setState(() {
      _shouldShowInput = true;
    });
  }

  void _handleAddInputDone(String ret) {
    handleInputDone(ret);
    setState(() {
      _shouldShowInput = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_shouldShowInput == true) ? TaskAddInput(_handleAddInputDone) : GestureDetector(
        onTap: () { handleAddInput(); },
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 40, bottom: 20),
          child: Icon(
              Icons.add
          ),
        )
    );
  }
}