import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:neat_nest/utilities/route/app_route_names.dart';

class AppNavigatorHelper {
  static void go(BuildContext context, AppRoute appRoute) {
    context.go(appRoute.path);
  }

  static void push(BuildContext context, AppRoute appRoute) {
    context.push(appRoute.path);
  }

  static void back(BuildContext context) {
    context.pop();
  }

  static void replace(BuildContext context, AppRoute appRoute) {
    context.replace(appRoute.path);
  }
}
