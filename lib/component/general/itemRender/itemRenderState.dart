import 'package:flutter/material.dart';
import 'package:task_check/component/general/dragItem/dragItem.dart';
import 'package:task_check/component/main/TaskAddInput.dart';
import 'dart:developer' as developer;

class ItemRenderState extends State {
  List<Map> dataList = new List<Map>();
  bool _shouldShowInput = false;
  bool _fetchDataDone = true;

  ItemRenderState(Future Function(List<Map>) dataFetch) {
    dataFetch(dataList).then((dynamic r) {
      setState(() {
        _fetchDataDone = false;
      });
    });
  }

  handleAddInput() {
    setState(() {
      _shouldShowInput = true;
    });
  }

  handleInputDone(String newValue) {
    setState(() {
      dataList.insert(dataList.length - 1, Map.fromEntries([MapEntry('task', newValue)]));
      _shouldShowInput = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _fetchDataDone ? CircularProgressIndicator() : new ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(left: 5, top: 5, right: 5),
                  child: dataList[index]['extra'] == null ? DragItem(
                      Text(dataList[index]['task']),
                      clickHandler: () {
                        Navigator.pushNamed(context, "/planDetail");
                      },
                  ) : Container(
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
      ),
    );
  }
}