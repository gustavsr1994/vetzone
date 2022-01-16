import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogCustom extends StatelessWidget {
  final String title;
  final String descError;
  AlertDialogCustom({required this.title, required this.descError});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(descError),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Ok'))
      ],
    );
  }
}
