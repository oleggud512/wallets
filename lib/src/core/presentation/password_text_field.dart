import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.validator,
    this.onChanged,
    this.controller,
    this.helperText = 'Password',
    this.onFieldSubmitted
  });

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String helperText;
  final void Function(String)? onFieldSubmitted;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool isPasswordShown = false;
  changePasswordShown(bool shown) => setState(() => isPasswordShown = shown);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: !isPasswordShown,
      decoration: InputDecoration(
        helperText: widget.helperText,
        suffixIcon: IconButton(
          onPressed: () {
            changePasswordShown(!isPasswordShown);
          },
          icon: Icon(isPasswordShown ? Icons.visibility_off : Icons.visibility)
        )
      ),
    );
  }
}