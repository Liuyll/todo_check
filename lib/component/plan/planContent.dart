import 'package:flutter/material.dart';

class PlanContent extends StatelessWidget {
  final String text;
  final String time;

  const PlanContent(this.text, this.time);
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Text(
              this.text,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(
              height: 5,
            ),
            Text(
              this.time,
              style: TextStyle(
                  fontSize: 11
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}