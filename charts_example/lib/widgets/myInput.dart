import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  String placeholder;
  var controller;
  Function onChanged;
  MyInput({Key? key, this.placeholder = '', this.controller, required this.onChanged})
      : super(key: key);

  InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(width: 3, color: Colors.transparent),
  );

  InputBorder error = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(width: 3, color: Colors.redAccent),
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChanged();
      },
      controller: controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          hintText: placeholder,
          border: InputBorder.none,
          filled: true,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: error),
    );
  }
}
