import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxlines = 1,
    this.onsaved,
    this.onchanged,
  });
  final String hint;
  final int maxlines;
  final Function(String?)? onsaved;
  final Function(String?)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field Is Requird';
        }
      },
      maxLines: maxlines,
      decoration: InputDecoration(
        hint: Text(hint, style: TextStyle(color: KColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
