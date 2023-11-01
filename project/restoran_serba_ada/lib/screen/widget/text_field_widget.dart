import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String errorMessage;
  final IconButton? prefixIcon;
  final TextEditingController dataController;
  final Function(String)? onChange;
  final bool? obscure;
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.errorMessage,
      this.prefixIcon,
      required this.dataController,
      this.onChange,
      this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dataController,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorText: errorMessage != '' ? errorMessage : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: BorderSide(
            color: ThemeColor().grey,
          ),
        ),
        prefixIcon: prefixIcon,
      ),
      onChanged: onChange,
    );
  }
}
