import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final bool isDate;
  final TextEditingController? controller;

  const SignUpFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.isDate,
    this.controller,
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
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.blue,
        ),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: _isChecked ? Colors.black : Colors.grey,
          ),
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
        onTap: () {
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
        },
      ),
    );
  }
}
