import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_application/components/text_field.dart';
import 'package:main_application/components/mybutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final idController = TextEditingController();
  var logger = Logger();

  Color primarnaBoja = const Color.fromARGB(255, 41, 4, 63);
  Color primarnaBoja2 = const Color.fromARGB(255, 37, 7, 56);
  Color primarnaBoja3 = const Color.fromARGB(255, 63, 15, 92);
  Color primarnaBoja4 = const Color.fromARGB(255, 76, 19, 112);
  Color primarnaBoja5 = const Color.fromARGB(218, 82, 20, 120);
  Color primarnaBoja6 = const Color.fromARGB(255, 84, 20, 124);
  Color sekundarnaBoja = const Color(0xFF424242);
  Color tercijarnaBoja = const Color.fromARGB(255, 46, 43, 43);

  bool isChecked = false;

  void signAuth() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: idController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        emailUpozorenje();
      } else if (e.code == 'wrong-password') {
        idUpozorenje();
      }
    }
  }

  void emailUpozorenje() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'E-mail koji ste unijeli nije ispravan!\n Pokušajte ponovo ili kontaktirajte pomoć',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  void idUpozorenje() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Lozinka koju ste unijeli nije ispravna!\n Pokušajte pnovo ili kontaktirajte pomoć',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loadCheckBoxValue();
  }

  void loadCheckBoxValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? checkBoxValue = prefs.getBool('checkBoxValue');
    setState(() {
      isChecked = checkBoxValue ?? false;
    });
  }

  void saveCheckBoxValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkBoxValue', value);
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.deepPurple;
    }

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [
          0.1,
          0.3,
          0.4,
          0.5,
          0.7,
          0.9,
        ],
        colors: [
          primarnaBoja,
          primarnaBoja2,
          primarnaBoja3,
          primarnaBoja4,
          primarnaBoja5,
          primarnaBoja6,
        ],
      )),
      child: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'lib/mainImages/vpLogo.png',
              width: 350,
              height: 250,
            ),
            const SizedBox(height: 5),
            Text('Dobrodošli na Konferenciju!'.toUpperCase(),
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 248, 248, 248),
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(height: 20),
            MyTextField(
              controller: emailController,
              hinttekst: 'e-mail',
              skrivenitekst: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: idController,
              hinttekst: 'ID',
              skrivenitekst: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Zaboravili ste ID?',
                  style: GoogleFonts.openSans(
                      color: const Color.fromARGB(255, 201, 201, 201),
                      fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 25,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: CheckboxListTile(
                  title: Text(
                    'Pristajem na Uslove Korištenja',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.deepPurple,
                  overlayColor: MaterialStateProperty.resolveWith(getColor),
                  splashRadius: 0,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      saveCheckBoxValue(value);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),
            MyButton(
              onTap: signAuth,
            ),
          ],
        ),
      ))),
    ));
  }
}
