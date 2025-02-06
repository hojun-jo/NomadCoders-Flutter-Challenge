import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twitter/constants/icons.dart';

class SignUpFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final void Function(String?) onSaved;
  final bool isDate;
  final bool isEmail;

  const SignUpFormField({
    super.key,
    required this.labelText,
    this.controller,
    required this.onSaved,
    this.isDate = false,
    this.isEmail = false,
  });

  @override
  State<SignUpFormField> createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> {
  bool _isChecked = false;
  bool _hasFocus = false;

  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.blue,
        ),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: _hasFocus ? Colors.black : Colors.grey,
          ),
          errorText: _errorText,
          suffixIcon: _isChecked ? checkIcon : null,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onChanged: _onValueChanged,
        onTap: _onFieldTap,
        onSaved: widget.onSaved,
      ),
    );
  }

  void _onValueChanged(String value) {
    if (value.isEmpty) {
      _isChecked = false;
    } else {
      _isChecked = true;
    }
    if (widget.isEmail) {
      _errorText = _isEmailValid(value);
    }
    setState(() {});
  }

  void _onFieldTap() {
    _hasFocus = true;
    if (widget.isDate) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) {
          return CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              widget.controller?.text = DateFormat.yMMMMd().format(value);
              _isChecked = true;
            },
          );
        },
      );
    }
    setState(() {});
  }

  String? _isEmailValid(String email) {
    if (email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(email)) {
      return "Email not valid";
    }
    return null;
  }
}
