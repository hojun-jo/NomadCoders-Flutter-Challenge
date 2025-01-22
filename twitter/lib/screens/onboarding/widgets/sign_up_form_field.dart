import 'package:flutter/material.dart';

class SignUpFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final bool isDate;

  const SignUpFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.isDate,
  });

  @override
  State<SignUpFormField> createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextFormField(
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.black),
          suffixIcon: _isChecked
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : null,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            _isChecked = false;
          } else {
            _isChecked = true;
          }
          setState(() {});
        },
      ),
    );
  }
}
