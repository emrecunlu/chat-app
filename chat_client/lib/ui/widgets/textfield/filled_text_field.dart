import 'package:flutter/material.dart';

class FilledTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintText;
  final bool secure;
  const FilledTextField(
      {super.key, this.validator, this.controller, required this.hintText, this.secure = false});

  @override
  State<FilledTextField> createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends State<FilledTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      obscureText: widget.secure,
      validator: widget.validator,
    );
  }
}
