import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/widget/button_widget.dart';
import 'package:restoran_serba_ada/screen/widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(
                height: 56,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Selamat Datang',
                  style: ThemeTextStyle().labelLarge,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFieldWidget(
                hintText: "Username",
                errorMessage: "Username Salah",
                dataController: usernameController,
              ),
              const SizedBox(
                height: 18,
              ),
              TextFieldWidget(
                hintText: "Password",
                errorMessage: "Password Salah",
                dataController: passwordController,
              ),
              const SizedBox(
                height: 56,
              ),
              ButtonWidget(
                textButton: "Log In",
                route: '/home',
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
