import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

enum ResponseState { success, warning, error }

class DisplayMotionToast {
  final String message;
  final BuildContext context;
  final ResponseState state;

  DisplayMotionToast({
    required this.message,
    required this.context,
    required this.state

  });

  void displayMotionToast(ResponseState responseState) {
    final MotionToast builder = _getMotionToastBuilder(state);
    builder.show(context);
  }
  MotionToast _getMotionToastBuilder(ResponseState responseState) {
    switch (state) {
      case ResponseState.success:
        return MotionToast.success(
          title: const Text(
            'Success',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          description:Text(
            message,
            style: const TextStyle(fontSize: 12),
          ),
          layoutOrientation: ToastOrientation.rtl,
          animationType: AnimationType.fromRight,
          dismissable: true,
        );
      case ResponseState.warning:
        return MotionToast.warning(
          title: Text(
            message,
            style: const TextStyle(fontSize: 12),
          ),
          description: const Text('There was a warning'),
          animationCurve: Curves.bounceIn,
          borderRadius: 0,
          animationDuration: const Duration(milliseconds: 1000),
        );
      case ResponseState.error:
        return MotionToast.error(
          title: Text(
            message,
            style: const TextStyle(fontSize: 12),
          ),
          description: const Text('There was an error'),
          position: MotionToastPosition.top,
          barrierColor: Colors.black.withOpacity(0.3),
          width: 300,
          height: 80,
          dismissable: false,
        );
    }
  }
}


