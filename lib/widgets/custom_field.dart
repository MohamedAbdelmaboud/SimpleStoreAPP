import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
   CustomField({
    super.key,
    this.hintText,
    this.onChanged,
    this.controller,
    this.keyboardType
  });
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Pattern deniedPattern=RegExp(r'[\u0600-\u06FF\s]+');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        inputFormatters: [
         // LengthLimitingTextInputFormatter(5), length for input
          FilteringTextInputFormatter(deniedPattern, allow: false)
          ],
        keyboardType: keyboardType,
        style: GoogleFonts.montserrat(color: Colors.black),
        onChanged: onChanged,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle:
                GoogleFonts.montserrat(color: Colors.black, fontSize: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.cyan, width: 1.5),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
