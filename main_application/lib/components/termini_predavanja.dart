// ignore_for_file: override_on_non_overriding_member
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Predavanja extends StatefulWidget {
  const Predavanja({super.key});
  @override
  State<Predavanja> createState() => PredavanjaState();
}

class PredavanjaState extends State<Predavanja> {
  DateTime currDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    Text('Danas',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )))
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 20, left: 10),
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.deepPurple,
                selectedTextColor: Colors.white,
                dateTextStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                dayTextStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                monthTextStyle: GoogleFonts.montserrat( 
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                onDateChange: (date) {
                  currDateTime = date;
                },
              )),
          //expand
        ],
      ),
    );
  }
}
