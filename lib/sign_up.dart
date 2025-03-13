import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedit/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPswdController = TextEditingController();

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', _emailController.text);
      await prefs.setString('mobile', _mobileController.text);
      await prefs.setString('password', _passwordController.text);
    }
  }

  String selectedCountryCode = '+91';
  bool _textFormField = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFormField = false;
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  void login() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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
                      'Create Account',
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
                      'Sign up to continue',
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
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Create password',
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

                SizedBox(height: 10),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Confirm Password',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _confirmPswdController,
                      keyboardType: TextInputType.text,
                      obscureText: !_confirmPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Re-enter password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                          icon: Icon(
                            _confirmPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                            color: Color.fromARGB(255, 75, 101, 243),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      activeColor: Color.fromARGB(255, 75, 101, 243),
                      value: value,
                      side: BorderSide(
                        color: Color.fromARGB(255, 75, 101, 243),
                        width: 2,
                      ),
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
                    Text('I agree with policy'),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 70),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.notoSansAdlamUnjoined(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(width: 10),

                    Text(
                      'or sign up with',
                      style: TextStyle(color: Colors.grey),
                    ),

                    SizedBox(width: 10),
                    Expanded(child: Divider()),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    socialButton('assets/google.png'),

                    socialButton('assets/apple.png'),

                    socialButton('assets/facebook.png'),
                  ],
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    Text('Already have an account? '),
                    GestureDetector(
                      onTap: login,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 75, 101, 243),
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

  Widget socialButton(String asset) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 226, 233, 252),
      ),
      child: Image.asset(asset, width: 25),
    );
  }
}
