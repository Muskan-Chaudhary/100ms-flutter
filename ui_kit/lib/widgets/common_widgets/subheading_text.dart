import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SubheadingText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? letterSpacing;
  final double? lineHeight;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;

  const SubheadingText(
      {Key? key,
      required this.text,
      required this.textColor,
      this.letterSpacing = 0.25,
      this.lineHeight = 20 / 14,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w400,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: textOverflow,
        style: GoogleFonts.inter(
            height: lineHeight! / fontSize!,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            color: textColor,
            fontWeight: fontWeight));
  }
}
