import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_controller.dart';

/// Professional minimal BaseView that takes any GetX controller
abstract class BaseView<T extends GetxController> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key);

  /// Override this method to build your screen
  /// You have access to all controller properties via 'controller'
  @override
  Widget build(BuildContext context);
}