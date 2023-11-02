import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {super.key,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 16, this.textAlign,
      });
  final Color color;
  final double fontSize;
  final String text;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  Text pacifico() {
    return Text(
      text,
      style: GoogleFonts.pacifico(
          fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        
          fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
//JetBrains Mono