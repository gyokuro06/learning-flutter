import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_ui/footer.dart';
import 'package:sign_in_sign_up_ui/form.dart';
import 'package:sign_in_sign_up_ui/header.dart';

const Color kSecondaryColor = Color(0xFFFE7C64);
const Color kBackgroundColor = Color(0xFF19283D);
const Color kTextColorPrimary = Color(0xFFECEFF1);
const Color kTextColorSecondary = Color(0xFFB0BEC5);
const Color kButtonColorPrimary = Color(0xFFECEFF1);
const Color kButtonTextColorPrimary = Color(0xFF455A64);
const Color kIconColor = Color(0xFF455A64);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData theme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignIn SignUp UI',
      theme: ThemeData.dark().copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: kSecondaryColor),
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              SignInForm(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
