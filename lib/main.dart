import 'package:flutter/material.dart';
import 'package:schedit/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedit',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromARGB(255, 75, 101, 243),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                                      color: Colors.grey.shade600,
                                      width: 1,
                                    ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                                      color: Color.fromARGB(255, 75, 101, 243),
                                      width: 2,
                                    ),
          )
        ),        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 75, 101, 243)),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 75, 101, 243),
            foregroundColor: Color.fromARGB(255, 75, 101, 243),
          ),

        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
