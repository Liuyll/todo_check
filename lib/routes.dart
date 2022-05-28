import 'package:flutter/cupertino.dart';
import 'package:task_check/page/plan/main.dart';

typedef RouteBuilder = Widget Function(BuildContext ctx);
Map<String, RouteBuilder> routes = {
  '/planDetail': (context) => PlanDetailPage()
};