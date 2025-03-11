import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color.fromARGB(255, 75, 101, 243),
        title: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.dark_mode_outlined,
                color: Color.fromARGB(255, 75, 101, 243),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Login Account',
                    style: GoogleFonts.notoSansAdlamUnjoined(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 75, 101, 243),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.notoSansAdlamUnjoined(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mobile Number?',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 75, 101, 243),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter email address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Create password',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color.fromARGB(255, 75, 101, 243),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Color.fromARGB(255, 75, 101, 243),
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: Color.fromARGB(255, 75, 101, 243),
                    value: value,
                    visualDensity: VisualDensity(horizontal: -4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onChanged: (bool? newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                  Text('Keep me logged in'),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 75, 101, 243),
                  foregroundColor: Color.fromARGB(255, 75, 101, 243),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 60),
                ),
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 10),

                  Text('or sign in with',style: TextStyle(color: Colors.grey),),

                  SizedBox(width: 10),
                  Expanded(child: Divider()),
                ],
              ),

              SizedBox(height: 20),

              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 226, 233, 252),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/google.png', width: 30),
                        SizedBox(width: 10),
                        Text('Continue With Apple')
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),

                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 226, 233, 252),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/apple.png', width: 30),
                        SizedBox(width: 10),
                        Text('Continue With Apple')
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),


                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 226, 233, 252),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/facebook.png', width: 30),
                        SizedBox(width: 10),
                        Text('Continue With Facebook')
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('Dont have an account? '),
                  Text(
                    'Sign Up',
                    style: TextStyle(color: Color.fromARGB(255, 75, 101, 243)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
