import 'package:flutter/cupertino.dart';
import 'package:task_check/page/plan/plan.dart';

typedef RouteBuilder = Widget Function(BuildContext ctx);
Map<String, RouteBuilder> routes = {
  '/plan': (context) => PlanDetailPage()
};