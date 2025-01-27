import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twitter/constants/icons.dart';

class SignUpFormField extends StatefulWidget {
  final String labelText;
  final bool isDate;
  final TextEditingController? controller;
  final void Function(String?) onSaved;

  const SignUpFormField({
    super.key,
    required this.labelText,
    required this.isDate,
    this.controller,
    required this.onSaved,
  });

  @override
  State<SignUpFormField> createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> {
  bool _isChecked = false;
  bool _hasFocus = false;

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
          suffixIcon: _isChecked ? checkIcon : null,
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
        onTap: () {
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
        },
        onSaved: widget.onSaved,
      ),
    );
  }
}
