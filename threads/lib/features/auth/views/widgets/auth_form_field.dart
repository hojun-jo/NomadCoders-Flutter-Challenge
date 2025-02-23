import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final String? Function(String?) validator;
  final Function(String?) onSaved;

  const AuthFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
