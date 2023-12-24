// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final dynamic controller;
  final String hinttekst;
  final bool skrivenitekst;
  final Color zlatnaBoja = const Color(0xFFFFC400);

  const MyTextField({
    super.key,
    required this.controller,
    required this.hinttekst,
    required this.skrivenitekst,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          TextField(
            controller: controller,
            obscureText: skrivenitekst,
            cursorColor: const Color.fromARGB(255, 191, 89, 255),
            cursorWidth: 3,
            maxLength: 50,
            style: const TextStyle(
              color: Color.fromARGB(255, 159, 159, 159),
            ),
            autocorrect: false,
            enableSuggestions: false,
            maxLines: 1,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              icon: const Icon(Icons.person_2_sharp,
                  color: Color.fromARGB(234, 248, 248, 248)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
              errorMaxLines: 1,
              hintText: hinttekst,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(200, 115, 113, 113), fontSize: 14),
              filled: true,
              fillColor: Color.fromARGB(255, 245, 236, 255),
            ),
          ),
        ],
      ),
    );
  }
}
