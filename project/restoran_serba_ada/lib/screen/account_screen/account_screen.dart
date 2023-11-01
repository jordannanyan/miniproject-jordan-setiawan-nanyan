import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/widget/appbar_widget.dart';
import 'package:restoran_serba_ada/screen/widget/button_widget.dart';
import 'package:restoran_serba_ada/screen/widget/text_field_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        appbarText: 'Account',
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'User Data',
                style: ThemeTextStyle().textStyleFirstBold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Column(
                children: [
                  TextFieldWidget(
                    hintText: 'Input New Username',
                    errorMessage: '',
                    dataController: usernameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                    hintText: 'Input New Password',
                    errorMessage: '',
                    dataController: passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed('/home');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          ThemeColor().lightRed,
                        ),
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
            const ButtonWidget(
              textButton: 'Log Out',
              route: '/login',
            ),
          ],
        ),
      ),
    );
  }
}
