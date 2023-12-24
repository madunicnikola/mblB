import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  const MyButton({super.key, required this.onTap});

  final Color zlatnaBoja = const Color(0xFFFFC400);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Color.fromARGB(255, 243, 231, 255),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "Prijavi se".toUpperCase(),
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
