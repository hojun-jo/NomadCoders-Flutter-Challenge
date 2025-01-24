import 'package:flutter/material.dart';

class ValidationCodeForm extends StatefulWidget {
  final void Function(bool) onComplete;

  const ValidationCodeForm({
    super.key,
    required this.onComplete,
  });

  @override
  State<ValidationCodeForm> createState() => _ValidationCodeFormState();
}

class _ValidationCodeFormState extends State<ValidationCodeForm> {
  Map<String, String> data = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          _makeFormField(
            autofocus: true,
            onChanged: (value) {
              data["1"] = value;
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          _makeFormField(
            onChanged: (value) {
              data["2"] = value;
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          _makeFormField(
            onChanged: (value) {
              data["3"] = value;
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          _makeFormField(
            onChanged: (value) {
              data["4"] = value;
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          _makeFormField(
            onChanged: (value) {
              data["5"] = value;
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          _makeFormField(
            onChanged: (value) {
              data["6"] = value;
              FocusScope.of(context).unfocus();
              widget.onComplete(true);
            },
          ),
        ],
      ),
    );
  }

  _makeFormField({
    bool autofocus = false,
    FocusNode? focusNode,
    required void Function(String) onChanged,
  }) {
    return Flexible(
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
        autofocus: autofocus,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        showCursor: false,
        maxLength: 1,
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          counterText: "",
        ),
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}
