import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_application/components/account.dart';
import 'package:main_application/components/prisustvo.dart';
import 'package:main_application/components/termini_predavanja.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class GlavnaApp extends StatefulWidget {
  const GlavnaApp({super.key});
  @override
  State<GlavnaApp> createState() => _GlavnaAppState();
}

@override
class _GlavnaAppState extends State<GlavnaApp> {
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  final dynamic controller = TextEditingController();

  String ime = '';

  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Kako se zoveš?',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                content: TextField(
                    autofocus: true,
                    autocorrect: false,
                    onChanged: (value) {},
                    controller: controller,
                    decoration:
                        InputDecoration(hintText: 'Reci nam svoje ime!')),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: Text(
                      'UNESI',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final ime = await controller.text;
                      if (ime == null || ime.isEmpty) return;
                      setState(
                        () => this.ime = ime,
                      );
                      Navigator.of(context).pop(controller.text);
                    },
                  ),
                ],
              );
            });
      },
    );
  }

  dynamic PreferredSizeWidget;

  int currIndex = 0;
  Color primarnaBoja6 = const Color.fromARGB(255, 152, 6, 243);

  List<IconData> navBarIcons = [
    FontAwesomeIcons.calendar,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user
  ];

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dobrodošli' + ' ' + '${ime}!',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        actions: [
          IconButton(
              onPressed: logOut,
              icon: const Icon(Icons.logout, color: Colors.deepPurple))
        ],
      ),
      body: IndexedStack(
        index: currIndex,
        children: const [
          Predavanja(),
          Prisustvo(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 15,
        ),
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < navBarIcons.length; i++) ...<Expanded>{
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currIndex = i;
                      });
                    },
                    child: SizedBox(
                      height: screenHeight,
                      width: screenWidth,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              navBarIcons[i],
                              color: i == currIndex
                                  ? primarnaBoja6
                                  : Colors.deepPurple,
                              size: i == currIndex ? 28 : 26,
                            ),
                            i == currIndex
                                ? Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    height: 3,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: primarnaBoja6,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40)),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              },
            ],
          ),
        ),
      ),
    );
  }
}
