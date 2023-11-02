import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // have no arguments and return no data.
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width * 0.3, 37),
            backgroundColor: const Color(0xFF7CE5F3),
            elevation: 10,
            shadowColor: Colors.cyan,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: CustomText(text, color: Colors.black));
  }
}
