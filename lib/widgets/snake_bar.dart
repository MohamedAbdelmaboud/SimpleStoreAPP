import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_text.dart';

void showSnakeBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
      content: Center(
        child: CustomText(
          massage,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
    ));
}

