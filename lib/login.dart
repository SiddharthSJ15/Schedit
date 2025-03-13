import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedit/acount_succes.dart';
import 'package:schedit/forgot_password.dart';
import 'package:schedit/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> loginData() async {
    String? email = _emailController.text.trim();
    String? password = _passwordController.text.trim();
    String? mobile = _mobileController.text.trim();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');
    String? savedMobile = prefs.getString('mobile');
    if (_formKey.currentState!.validate() &&
        (savedEmail == email || savedMobile == mobile) &&
        savedPassword == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountCreated()),
      );
    }
  }

  String selectedCountryCode = '+91';

  bool _passwordVisible = false;
  bool _textFormField = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFormField = false;
    _passwordVisible = false;
    _textFormField = false;
  }

  void signup() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  void forgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPassword()),
    );
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login Account',
                      style: GoogleFonts.inter(
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

                _textFormField
                    ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mobile Number',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _textFormField = !_textFormField;
                                });
                              },
                              child: Text(
                                'Email Address?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 75, 101, 243),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 55,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade600),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: CountryCodePicker(
                                onChanged: (country) {
                                  setState(() {
                                    selectedCountryCode = country.dialCode!;
                                  });
                                },
                                searchDecoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                initialSelection: 'IN',
                                showFlag: true,
                                showDropDownButton: false,
                                flagWidth: 30,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: _mobileController,
                                decoration: InputDecoration(
                                  hintText: 'Enter mobile number',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 75, 101, 243),
                                      width: 2,
                                    ),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                    : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Email Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _textFormField = !_textFormField;
                                });
                              },
                              child: Text(
                                'Mobile Number?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 75, 101, 243),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _emailController,
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
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                            color: Color.fromARGB(255, 75, 101, 243),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: forgotPassword,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color.fromARGB(255, 75, 101, 243),
                        ),
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
                  onPressed: loginData,
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

                    Text(
                      'or sign in with',
                      style: TextStyle(color: Colors.grey),
                    ),

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
                          Text('Continue With Apple'),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

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
                          Text('Continue With Apple'),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

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
                          Text('Continue With Facebook'),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: signup,
                      child: GestureDetector(
                        onTap: signup,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 75, 101, 243),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
