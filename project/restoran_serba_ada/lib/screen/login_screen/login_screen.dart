import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/screen/login_screen/bloc/get_login_data_bloc/get_login_data_bloc.dart';
import 'package:restoran_serba_ada/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/widget/button_widget.dart';
import 'package:restoran_serba_ada/screen/widget/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late SharedPreferences logindata;

  void getLoginData() async {
    logindata = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                errorMessage: "",
                dataController: usernameController,
                onChange: (value) {
                  BlocProvider.of<GetInputLoginDataBloc>(context)
                      .add(GetUsernameEvent(data: value));
                },
              ),
              const SizedBox(
                height: 18,
              ),
              TextFieldWidget(
                hintText: "Password",
                errorMessage: "",
                dataController: passwordController,
                obscure: true,
                onChange: (value) {
                  BlocProvider.of<GetInputLoginDataBloc>(context)
                      .add(GetPasswordEvent(data: value));
                },
              ),
              const SizedBox(
                height: 56,
              ),
              ButtonWidget(
                textButton: "Log In",
                route: '',
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  if (username.isNotEmpty && password.isNotEmpty) {
                    logindata.setBool('login', false);
                    logindata.setString('username', username);
                    logindata.setString('password', password);
                    Navigator.of(context).pushNamed('/home');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
