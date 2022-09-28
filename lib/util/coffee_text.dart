import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeText extends StatefulWidget {
  final String coffeetype;
  final bool check;
  final VoidCallback onTap;
  const CoffeeText(
      {required this.coffeetype,
      required this.check,
      required this.onTap,
      super.key});

  @override
  State<CoffeeText> createState() => _CoffeeTextState();
}

class _CoffeeTextState extends State<CoffeeText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          widget.coffeetype,
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: widget.check == true ? Colors.orange : Colors.grey,
          ),
        ),
      ),
    );
  }
}
