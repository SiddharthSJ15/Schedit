import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedit/login.dart';
import 'package:schedit/sign_up.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void signup() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  void login() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 75, 101, 243),
                ),
              ),
              Icon(
                Icons.dark_mode_outlined,
                color: Color.fromARGB(255, 75, 101, 243),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Login or Signup to continue',
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),

              SizedBox(height: 60),

              Image.asset('assets/tree_logo.png'),

              SizedBox(height: 30),

              Image.asset('assets/schedit_blue.png', width: 150),

              Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 60, 5),
                child: Text(
                  'A Family Scheduling App For Parents',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: signup,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  // backgroundColor: Color.fromARGB(255, 75, 101, 243),
                  // foregroundColor: Color.fromARGB(255, 75, 101, 243),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 70),
                ),
                child: Text(
                  'Create Account',
                  style: GoogleFonts.notoSansAdlamUnjoined(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 75, 101, 243),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 70),
                ),
                child: Text(
                  'Already have an account',
                  style: GoogleFonts.notoSansAdlamUnjoined(
                    color: Color.fromARGB(255, 75, 101, 243),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Continue as a guest?',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
