import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  // Method to change focus of TextFormField

  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocusNode,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  // Method for flushbar error message
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(Icons.error, size: 28, color: Colors.white),
          flushbarPosition: FlushbarPosition.BOTTOM,
          forwardAnimationCurve: Curves.decelerate,
        )..show(context));
  }
}
